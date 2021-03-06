--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FIFO_credit_based is
    generic (
        DATA_WIDTH: integer := 32
    );
    port (  reset: in  std_logic;
            clk: in  std_logic;
            RX: in std_logic_vector(DATA_WIDTH-1 downto 0);
            valid_in: in std_logic;
            fault_in: in std_logic;
            read_en_N : in std_logic;
            read_en_E : in std_logic;
            read_en_W : in std_logic;
            read_en_S : in std_logic;
            read_en_L : in std_logic;
            credit_out: out std_logic;
            empty_out: out std_logic;
            fault_out: out std_logic;
            Data_out:  out std_logic_vector(DATA_WIDTH-1 downto 0)
    );
end FIFO_credit_based;

architecture behavior of FIFO_credit_based is
   signal read_pointer, read_pointer_in,  write_pointer, write_pointer_in: std_logic_vector(3 downto 0);
   signal read_pointer_prev, write_pointer_prev, write_pointer_effective: std_logic_vector(3 downto 0);
   signal full, empty: std_logic;
   signal read_en, write_en: std_logic;
   signal written_data: std_logic_vector(DATA_WIDTH-1 downto 0);
   signal Data_out_current, Data_out_prev : std_logic_vector(DATA_WIDTH-1 downto 0);
   signal FIFO_MEM_1, FIFO_MEM_1_in : std_logic_vector(DATA_WIDTH-1 downto 0);
   signal FIFO_MEM_2, FIFO_MEM_2_in : std_logic_vector(DATA_WIDTH-1 downto 0);
   signal FIFO_MEM_3, FIFO_MEM_3_in : std_logic_vector(DATA_WIDTH-1 downto 0);
   signal FIFO_MEM_4, FIFO_MEM_4_in : std_logic_vector(DATA_WIDTH-1 downto 0);

   signal fault: std_logic;
begin
 --------------------------------------------------------------------------------------------
--                           block diagram of the FIFO!


 --------------------------------------------------------------------------------------------
--  circular buffer structure
--                                   <--- WriteP
--              ---------------------------------
--              |   3   |   2   |   1   |   0   |
--              ---------------------------------
--                                   <--- readP
 --------------------------------------------------------------------------------------------

   process (clk, reset)begin
        if reset = '0' then
            read_pointer  <= "0001";
            write_pointer <= "0001";

            FIFO_MEM_1 <= (others=>'0');
            FIFO_MEM_2 <= (others=>'0');
            FIFO_MEM_3 <= (others=>'0');
            FIFO_MEM_4 <= (others=>'0');

            credit_out <= '0';

        elsif clk'event and clk = '1' then

            write_pointer <= write_pointer_in;

            read_pointer  <=  read_pointer_in;
            credit_out <= '0';
            if write_en = '1' then
                --write into the memory
                  FIFO_MEM_1 <= FIFO_MEM_1_in;
                  FIFO_MEM_2 <= FIFO_MEM_2_in;
                  FIFO_MEM_3 <= FIFO_MEM_3_in;
                  FIFO_MEM_4 <= FIFO_MEM_4_in;
            end if;
            if read_en = '1' then
              credit_out <= '1';
            end if;
        end if;
    end process;

 -- anything below here is pure combinational

   -- combinatorial part
   process(RX, write_pointer_effective, FIFO_MEM_1, FIFO_MEM_2, FIFO_MEM_3, FIFO_MEM_4)begin
      case( write_pointer_effective ) is
          when "0001" => FIFO_MEM_1_in <= RX;         FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
          when "0010" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= RX;         FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
          when "0100" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= RX;         FIFO_MEM_4_in <= FIFO_MEM_4;
          when "1000" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= RX;
          when others => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
      end case ;
   end process;

  process(read_pointer, FIFO_MEM_1, FIFO_MEM_2, FIFO_MEM_3, FIFO_MEM_4)begin
    case( read_pointer ) is
        when "0001" => Data_out_current <= FIFO_MEM_1;
        when "0010" => Data_out_current <= FIFO_MEM_2;
        when "0100" => Data_out_current <= FIFO_MEM_3;
        when "1000" => Data_out_current <= FIFO_MEM_4;
        when others => Data_out_current <= FIFO_MEM_1;
    end case ;
  end process;


  process(read_pointer_prev, FIFO_MEM_1, FIFO_MEM_2, FIFO_MEM_3, FIFO_MEM_4)begin
    case( read_pointer_prev ) is
        when "0001" => Data_out_prev <= FIFO_MEM_1;
        when "0010" => Data_out_prev <= FIFO_MEM_2;
        when "0100" => Data_out_prev <= FIFO_MEM_3;
        when "1000" => Data_out_prev <= FIFO_MEM_4;
        when others => Data_out_prev <= FIFO_MEM_1;
    end case ;
  end process;


  process(Data_out_prev, Data_out_current, fault_in) begin
    if fault_in = '1' then
      Data_out <= Data_out_prev;
    else
      Data_out <= Data_out_current;
    end if;
  end process;

  process(write_pointer_prev, FIFO_MEM_1, FIFO_MEM_2, FIFO_MEM_3, FIFO_MEM_4)begin
    case( write_pointer_prev ) is
        when "0001" => written_data <= FIFO_MEM_1;
        when "0010" => written_data <= FIFO_MEM_2;
        when "0100" => written_data <= FIFO_MEM_3;
        when "1000" => written_data <= FIFO_MEM_4;
        when others => written_data <= FIFO_MEM_1;
    end case ;
  end process;

  process(written_data, write_pointer, write_pointer_prev)begin
    fault <= '0';
    write_pointer_effective <= write_pointer;
    if XOR_REDUCE(written_data) /= '0' then
      fault <= '1';
      write_pointer_effective <= write_pointer_prev;
    end if;
  end process;

  fault_out <= fault;

  read_en <= (read_en_N or read_en_E or read_en_W or read_en_S or read_en_L) and not empty;
  empty_out <= empty or fault;

 write_pointer_prev <= write_pointer(0) & write_pointer(3 downto 1);

 read_pointer_prev <= read_pointer(0) & read_pointer(3 downto 1);

  process(write_en, write_pointer, fault)begin
    if write_en = '1'then
        write_pointer_in <= write_pointer(2 downto 0)&write_pointer(3);
       if fault = '1' then
         write_pointer_in <= write_pointer;
       end if;
    else
       write_pointer_in <= write_pointer;
    end if;
  end process;

  process(read_en, empty, read_pointer)begin
       if (read_en = '1' and empty = '0') then
           read_pointer_in <= read_pointer(2 downto 0)&read_pointer(3);
       else
           read_pointer_in <= read_pointer;
       end if;
  end process;

  process(full, valid_in, fault) begin
     if (valid_in = '1' and full ='0') or fault='1' then
         write_en <= '1';
     else
         write_en <= '0';
     end if;
  end process;

  process(write_pointer_effective, read_pointer) begin
      if read_pointer = write_pointer  then
              empty <= '1';
      else
              empty <= '0';
      end if;
      --      if write_pointer = read_pointer>>1 then
      if write_pointer_effective = read_pointer(0)&read_pointer(3 downto 1) then
              full <= '1';
      else
              full <= '0';
      end if;
  end process;

end;
