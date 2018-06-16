--Copyright (C) 2016 Siavoosh Payandeh Azad
------------------------------------------------------------
-- This file is automatically generated Please do not change!
-- Here are the parameters:
-- 	 network size x:4
-- 	 network size y:4
-- 	 data width:32-- 	 traffic pattern:------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.TB_Package.all;

use work.router_pack.all;

USE ieee.numeric_std.ALL; 
-- use IEEE.math_real."ceil";
-- use IEEE.math_real."log2";

entity tb_network_4x4 is
end tb_network_4x4; 


architecture behavior of tb_network_4x4 is

-- Declaring network component

function log2( i : integer) return integer is 
    variable temp    : integer := i; 
    variable ret_val : integer := 1; --log2 of 0 should equal 1 because you still need 1 bit to represent 0 
  begin                  
    while temp > 1 loop 
      ret_val := ret_val + 1; 
      temp    := temp / 2;      
    end loop; 
     
    return ret_val; 
  end function; 

component network_4x4 is
 generic (DATA_WIDTH: integer := 32);
port (reset: in  std_logic; 
	clk: in  std_logic; 
	--------------
	RX_L_0: in std_logic_vector (DATA_WIDTH-1 downto 0);
	credit_out_L_0, valid_out_L_0: out std_logic;
	credit_in_L_0, valid_in_L_0: in std_logic;
	TX_L_0: out std_logic_vector (DATA_WIDTH-1 downto 0);
	--------------
	RX_L_1: in std_logic_vector (DATA_WIDTH-1 downto 0);
	credit_out_L_1, valid_out_L_1: out std_logic;
	credit_in_L_1, valid_in_L_1: in std_logic;
	TX_L_1: out std_logic_vector (DATA_WIDTH-1 downto 0);
	--------------
	RX_L_2: in std_logic_vector (DATA_WIDTH-1 downto 0);
	credit_out_L_2, valid_out_L_2: out std_logic;
	credit_in_L_2, valid_in_L_2: in std_logic;
	TX_L_2: out std_logic_vector (DATA_WIDTH-1 downto 0);
	--------------
	RX_L_3: in std_logic_vector (DATA_WIDTH-1 downto 0);
	credit_out_L_3, valid_out_L_3: out std_logic;
	credit_in_L_3, valid_in_L_3: in std_logic;
	TX_L_3: out std_logic_vector (DATA_WIDTH-1 downto 0);
	--------------
	RX_L_4: in std_logic_vector (DATA_WIDTH-1 downto 0);
	credit_out_L_4, valid_out_L_4: out std_logic;
	credit_in_L_4, valid_in_L_4: in std_logic;
	TX_L_4: out std_logic_vector (DATA_WIDTH-1 downto 0);
	--------------
	RX_L_5: in std_logic_vector (DATA_WIDTH-1 downto 0);
	credit_out_L_5, valid_out_L_5: out std_logic;
	credit_in_L_5, valid_in_L_5: in std_logic;
	TX_L_5: out std_logic_vector (DATA_WIDTH-1 downto 0);
	--------------
	RX_L_6: in std_logic_vector (DATA_WIDTH-1 downto 0);
	credit_out_L_6, valid_out_L_6: out std_logic;
	credit_in_L_6, valid_in_L_6: in std_logic;
	TX_L_6: out std_logic_vector (DATA_WIDTH-1 downto 0);
	--------------
	RX_L_7: in std_logic_vector (DATA_WIDTH-1 downto 0);
	credit_out_L_7, valid_out_L_7: out std_logic;
	credit_in_L_7, valid_in_L_7: in std_logic;
	TX_L_7: out std_logic_vector (DATA_WIDTH-1 downto 0);
	--------------
	RX_L_8: in std_logic_vector (DATA_WIDTH-1 downto 0);
	credit_out_L_8, valid_out_L_8: out std_logic;
	credit_in_L_8, valid_in_L_8: in std_logic;
	TX_L_8: out std_logic_vector (DATA_WIDTH-1 downto 0);
	--------------
	RX_L_9: in std_logic_vector (DATA_WIDTH-1 downto 0);
	credit_out_L_9, valid_out_L_9: out std_logic;
	credit_in_L_9, valid_in_L_9: in std_logic;
	TX_L_9: out std_logic_vector (DATA_WIDTH-1 downto 0);
	--------------
	RX_L_10: in std_logic_vector (DATA_WIDTH-1 downto 0);
	credit_out_L_10, valid_out_L_10: out std_logic;
	credit_in_L_10, valid_in_L_10: in std_logic;
	TX_L_10: out std_logic_vector (DATA_WIDTH-1 downto 0);
	--------------
	RX_L_11: in std_logic_vector (DATA_WIDTH-1 downto 0);
	credit_out_L_11, valid_out_L_11: out std_logic;
	credit_in_L_11, valid_in_L_11: in std_logic;
	TX_L_11: out std_logic_vector (DATA_WIDTH-1 downto 0);
	--------------
	RX_L_12: in std_logic_vector (DATA_WIDTH-1 downto 0);
	credit_out_L_12, valid_out_L_12: out std_logic;
	credit_in_L_12, valid_in_L_12: in std_logic;
	TX_L_12: out std_logic_vector (DATA_WIDTH-1 downto 0);
	--------------
	RX_L_13: in std_logic_vector (DATA_WIDTH-1 downto 0);
	credit_out_L_13, valid_out_L_13: out std_logic;
	credit_in_L_13, valid_in_L_13: in std_logic;
	TX_L_13: out std_logic_vector (DATA_WIDTH-1 downto 0);
	--------------
	RX_L_14: in std_logic_vector (DATA_WIDTH-1 downto 0);
	credit_out_L_14, valid_out_L_14: out std_logic;
	credit_in_L_14, valid_in_L_14: in std_logic;
	TX_L_14: out std_logic_vector (DATA_WIDTH-1 downto 0);
	--------------
	RX_L_15: in std_logic_vector (DATA_WIDTH-1 downto 0);
	credit_out_L_15, valid_out_L_15: out std_logic;
	credit_in_L_15, valid_in_L_15: in std_logic;
	TX_L_15: out std_logic_vector (DATA_WIDTH-1 downto 0)

            ); 
end component; 
component flit_tracker is
    generic (
        DATA_WIDTH: integer := 32;
        tracker_file: string :="track.txt"
    );
    port (
        clk: in std_logic;
        RX: in std_logic_vector (DATA_WIDTH-1 downto 0); 
        valid_in : in std_logic 
    );
end component;

-- generating bulk signals...
	signal RX_L_0, TX_L_0:  std_logic_vector (31 downto 0);
	signal credit_counter_out_0:  std_logic_vector (1 downto 0);
	signal credit_out_L_0, credit_in_L_0, valid_in_L_0, valid_out_L_0: std_logic;
	signal RX_L_1, TX_L_1:  std_logic_vector (31 downto 0);
	signal credit_counter_out_1:  std_logic_vector (1 downto 0);
	signal credit_out_L_1, credit_in_L_1, valid_in_L_1, valid_out_L_1: std_logic;
	signal RX_L_2, TX_L_2:  std_logic_vector (31 downto 0);
	signal credit_counter_out_2:  std_logic_vector (1 downto 0);
	signal credit_out_L_2, credit_in_L_2, valid_in_L_2, valid_out_L_2: std_logic;
	signal RX_L_3, TX_L_3:  std_logic_vector (31 downto 0);
	signal credit_counter_out_3:  std_logic_vector (1 downto 0);
	signal credit_out_L_3, credit_in_L_3, valid_in_L_3, valid_out_L_3: std_logic;
	signal RX_L_4, TX_L_4:  std_logic_vector (31 downto 0);
	signal credit_counter_out_4:  std_logic_vector (1 downto 0);
	signal credit_out_L_4, credit_in_L_4, valid_in_L_4, valid_out_L_4: std_logic;
	signal RX_L_5, TX_L_5:  std_logic_vector (31 downto 0);
	signal credit_counter_out_5:  std_logic_vector (1 downto 0);
	signal credit_out_L_5, credit_in_L_5, valid_in_L_5, valid_out_L_5: std_logic;
	signal RX_L_6, TX_L_6:  std_logic_vector (31 downto 0);
	signal credit_counter_out_6:  std_logic_vector (1 downto 0);
	signal credit_out_L_6, credit_in_L_6, valid_in_L_6, valid_out_L_6: std_logic;
	signal RX_L_7, TX_L_7:  std_logic_vector (31 downto 0);
	signal credit_counter_out_7:  std_logic_vector (1 downto 0);
	signal credit_out_L_7, credit_in_L_7, valid_in_L_7, valid_out_L_7: std_logic;
	signal RX_L_8, TX_L_8:  std_logic_vector (31 downto 0);
	signal credit_counter_out_8:  std_logic_vector (1 downto 0);
	signal credit_out_L_8, credit_in_L_8, valid_in_L_8, valid_out_L_8: std_logic;
	signal RX_L_9, TX_L_9:  std_logic_vector (31 downto 0);
	signal credit_counter_out_9:  std_logic_vector (1 downto 0);
	signal credit_out_L_9, credit_in_L_9, valid_in_L_9, valid_out_L_9: std_logic;
	signal RX_L_10, TX_L_10:  std_logic_vector (31 downto 0);
	signal credit_counter_out_10:  std_logic_vector (1 downto 0);
	signal credit_out_L_10, credit_in_L_10, valid_in_L_10, valid_out_L_10: std_logic;
	signal RX_L_11, TX_L_11:  std_logic_vector (31 downto 0);
	signal credit_counter_out_11:  std_logic_vector (1 downto 0);
	signal credit_out_L_11, credit_in_L_11, valid_in_L_11, valid_out_L_11: std_logic;
	signal RX_L_12, TX_L_12:  std_logic_vector (31 downto 0);
	signal credit_counter_out_12:  std_logic_vector (1 downto 0);
	signal credit_out_L_12, credit_in_L_12, valid_in_L_12, valid_out_L_12: std_logic;
	signal RX_L_13, TX_L_13:  std_logic_vector (31 downto 0);
	signal credit_counter_out_13:  std_logic_vector (1 downto 0);
	signal credit_out_L_13, credit_in_L_13, valid_in_L_13, valid_out_L_13: std_logic;
	signal RX_L_14, TX_L_14:  std_logic_vector (31 downto 0);
	signal credit_counter_out_14:  std_logic_vector (1 downto 0);
	signal credit_out_L_14, credit_in_L_14, valid_in_L_14, valid_out_L_14: std_logic;
	signal RX_L_15, TX_L_15:  std_logic_vector (31 downto 0);
	signal credit_counter_out_15:  std_logic_vector (1 downto 0);
	signal credit_out_L_15, credit_in_L_15, valid_in_L_15, valid_out_L_15: std_logic;
	--------------
	constant clk_period : time := 10 ns;
	constant NoC_size_x : integer := 4;
	constant NoC_size_y : integer := 4;
	signal reset, not_reset, clk: std_logic :='0';

begin

   clk_process :process
   begin
        clk <= '0';
        wait for clk_period/2;   
        clk <= '1';
        wait for clk_period/2; 
   end process;

reset <= '1' after 1 ns;

-- instantiating the network
-- instantiating the flit trackers
F_T_0_T: flit_tracker  generic map (
        DATA_WIDTH => 32, 
        tracker_file =>"traces/track0_T.txt"
    )
    port map (
        clk => clk, RX => TX_L_0, 
        valid_in => valid_out_L_0
    );
F_T_1_T: flit_tracker  generic map (
        DATA_WIDTH => 32, 
        tracker_file =>"traces/track1_T.txt"
    )
    port map (
        clk => clk, RX => TX_L_1, 
        valid_in => valid_out_L_1
    );
F_T_2_T: flit_tracker  generic map (
        DATA_WIDTH => 32, 
        tracker_file =>"traces/track2_T.txt"
    )
    port map (
        clk => clk, RX => TX_L_2, 
        valid_in => valid_out_L_2
    );
F_T_3_T: flit_tracker  generic map (
        DATA_WIDTH => 32, 
        tracker_file =>"traces/track3_T.txt"
    )
    port map (
        clk => clk, RX => TX_L_3, 
        valid_in => valid_out_L_3
    );
F_T_4_T: flit_tracker  generic map (
        DATA_WIDTH => 32, 
        tracker_file =>"traces/track4_T.txt"
    )
    port map (
        clk => clk, RX => TX_L_4, 
        valid_in => valid_out_L_4
    );
F_T_5_T: flit_tracker  generic map (
        DATA_WIDTH => 32, 
        tracker_file =>"traces/track5_T.txt"
    )
    port map (
        clk => clk, RX => TX_L_5, 
        valid_in => valid_out_L_5
    );
F_T_6_T: flit_tracker  generic map (
        DATA_WIDTH => 32, 
        tracker_file =>"traces/track6_T.txt"
    )
    port map (
        clk => clk, RX => TX_L_6, 
        valid_in => valid_out_L_6
    );
F_T_7_T: flit_tracker  generic map (
        DATA_WIDTH => 32, 
        tracker_file =>"traces/track7_T.txt"
    )
    port map (
        clk => clk, RX => TX_L_7, 
        valid_in => valid_out_L_7
    );
F_T_8_T: flit_tracker  generic map (
        DATA_WIDTH => 32, 
        tracker_file =>"traces/track8_T.txt"
    )
    port map (
        clk => clk, RX => TX_L_8, 
        valid_in => valid_out_L_8
    );
F_T_9_T: flit_tracker  generic map (
        DATA_WIDTH => 32, 
        tracker_file =>"traces/track9_T.txt"
    )
    port map (
        clk => clk, RX => TX_L_9, 
        valid_in => valid_out_L_9
    );
F_T_10_T: flit_tracker  generic map (
        DATA_WIDTH => 32, 
        tracker_file =>"traces/track10_T.txt"
    )
    port map (
        clk => clk, RX => TX_L_10, 
        valid_in => valid_out_L_10
    );
F_T_11_T: flit_tracker  generic map (
        DATA_WIDTH => 32, 
        tracker_file =>"traces/track11_T.txt"
    )
    port map (
        clk => clk, RX => TX_L_11, 
        valid_in => valid_out_L_11
    );
F_T_12_T: flit_tracker  generic map (
        DATA_WIDTH => 32, 
        tracker_file =>"traces/track12_T.txt"
    )
    port map (
        clk => clk, RX => TX_L_12, 
        valid_in => valid_out_L_12
    );
F_T_13_T: flit_tracker  generic map (
        DATA_WIDTH => 32, 
        tracker_file =>"traces/track13_T.txt"
    )
    port map (
        clk => clk, RX => TX_L_13, 
        valid_in => valid_out_L_13
    );
F_T_14_T: flit_tracker  generic map (
        DATA_WIDTH => 32, 
        tracker_file =>"traces/track14_T.txt"
    )
    port map (
        clk => clk, RX => TX_L_14, 
        valid_in => valid_out_L_14
    );
F_T_15_T: flit_tracker  generic map (
        DATA_WIDTH => 32, 
        tracker_file =>"traces/track15_T.txt"
    )
    port map (
        clk => clk, RX => TX_L_15, 
        valid_in => valid_out_L_15
    );
NoC: network_4x4 generic map (DATA_WIDTH  => 32)
port map (reset, clk, 
	RX_L_0, credit_out_L_0, valid_out_L_0, credit_in_L_0, valid_in_L_0,  TX_L_0, 
	RX_L_1, credit_out_L_1, valid_out_L_1, credit_in_L_1, valid_in_L_1,  TX_L_1, 
	RX_L_2, credit_out_L_2, valid_out_L_2, credit_in_L_2, valid_in_L_2,  TX_L_2, 
	RX_L_3, credit_out_L_3, valid_out_L_3, credit_in_L_3, valid_in_L_3,  TX_L_3, 
	RX_L_4, credit_out_L_4, valid_out_L_4, credit_in_L_4, valid_in_L_4,  TX_L_4, 
	RX_L_5, credit_out_L_5, valid_out_L_5, credit_in_L_5, valid_in_L_5,  TX_L_5, 
	RX_L_6, credit_out_L_6, valid_out_L_6, credit_in_L_6, valid_in_L_6,  TX_L_6, 
	RX_L_7, credit_out_L_7, valid_out_L_7, credit_in_L_7, valid_in_L_7,  TX_L_7, 
	RX_L_8, credit_out_L_8, valid_out_L_8, credit_in_L_8, valid_in_L_8,  TX_L_8, 
	RX_L_9, credit_out_L_9, valid_out_L_9, credit_in_L_9, valid_in_L_9,  TX_L_9, 
	RX_L_10, credit_out_L_10, valid_out_L_10, credit_in_L_10, valid_in_L_10,  TX_L_10, 
	RX_L_11, credit_out_L_11, valid_out_L_11, credit_in_L_11, valid_in_L_11,  TX_L_11, 
	RX_L_12, credit_out_L_12, valid_out_L_12, credit_in_L_12, valid_in_L_12,  TX_L_12, 
	RX_L_13, credit_out_L_13, valid_out_L_13, credit_in_L_13, valid_in_L_13,  TX_L_13, 
	RX_L_14, credit_out_L_14, valid_out_L_14, credit_in_L_14, valid_in_L_14,  TX_L_14, 
	RX_L_15, credit_out_L_15, valid_out_L_15, credit_in_L_15, valid_in_L_15,  TX_L_15
            ); 
not_reset <= not reset; 

-- connecting the packet generators
credit_counter_control(clk, credit_out_L_0, valid_in_L_0, credit_counter_out_0);
gen_random_packet(4, 4, 100, 0, 33, 8, 8, 10000 ns, clk, credit_counter_out_0, valid_in_L_0, RX_L_0);

credit_counter_control(clk, credit_out_L_1, valid_in_L_1, credit_counter_out_1);
gen_random_packet(4, 4, 100, 1, 46, 8, 8, 10000 ns, clk, credit_counter_out_1, valid_in_L_1, RX_L_1);

credit_counter_control(clk, credit_out_L_2, valid_in_L_2, credit_counter_out_2);
gen_random_packet(4, 4, 100, 2, 50, 8, 8, 10000 ns, clk, credit_counter_out_2, valid_in_L_2, RX_L_2);

credit_counter_control(clk, credit_out_L_3, valid_in_L_3, credit_counter_out_3);
gen_random_packet(4, 4, 100, 3, 28, 8, 8, 10000 ns, clk, credit_counter_out_3, valid_in_L_3, RX_L_3);

credit_counter_control(clk, credit_out_L_4, valid_in_L_4, credit_counter_out_4);
gen_random_packet(4, 4, 100, 4, 9, 8, 8, 10000 ns, clk, credit_counter_out_4, valid_in_L_4, RX_L_4);

credit_counter_control(clk, credit_out_L_5, valid_in_L_5, credit_counter_out_5);
gen_random_packet(4, 4, 100, 5, 22, 8, 8, 10000 ns, clk, credit_counter_out_5, valid_in_L_5, RX_L_5);

credit_counter_control(clk, credit_out_L_6, valid_in_L_6, credit_counter_out_6);
gen_random_packet(4, 4, 100, 6, 49, 8, 8, 10000 ns, clk, credit_counter_out_6, valid_in_L_6, RX_L_6);

credit_counter_control(clk, credit_out_L_7, valid_in_L_7, credit_counter_out_7);
gen_random_packet(4, 4, 100, 7, 6, 8, 8, 10000 ns, clk, credit_counter_out_7, valid_in_L_7, RX_L_7);

credit_counter_control(clk, credit_out_L_8, valid_in_L_8, credit_counter_out_8);
gen_random_packet(4, 4, 100, 8, 29, 8, 8, 10000 ns, clk, credit_counter_out_8, valid_in_L_8, RX_L_8);

credit_counter_control(clk, credit_out_L_9, valid_in_L_9, credit_counter_out_9);
gen_random_packet(4, 4, 100, 9, 38, 8, 8, 10000 ns, clk, credit_counter_out_9, valid_in_L_9, RX_L_9);

credit_counter_control(clk, credit_out_L_10, valid_in_L_10, credit_counter_out_10);
gen_random_packet(4, 4, 100, 10, 5, 8, 8, 10000 ns, clk, credit_counter_out_10, valid_in_L_10, RX_L_10);

credit_counter_control(clk, credit_out_L_11, valid_in_L_11, credit_counter_out_11);
gen_random_packet(4, 4, 100, 11, 46, 8, 8, 10000 ns, clk, credit_counter_out_11, valid_in_L_11, RX_L_11);

credit_counter_control(clk, credit_out_L_12, valid_in_L_12, credit_counter_out_12);
gen_random_packet(4, 4, 100, 12, 28, 8, 8, 10000 ns, clk, credit_counter_out_12, valid_in_L_12, RX_L_12);

credit_counter_control(clk, credit_out_L_13, valid_in_L_13, credit_counter_out_13);
gen_random_packet(4, 4, 100, 13, 10, 8, 8, 10000 ns, clk, credit_counter_out_13, valid_in_L_13, RX_L_13);

credit_counter_control(clk, credit_out_L_14, valid_in_L_14, credit_counter_out_14);
gen_random_packet(4, 4, 100, 14, 27, 8, 8, 10000 ns, clk, credit_counter_out_14, valid_in_L_14, RX_L_14);

credit_counter_control(clk, credit_out_L_15, valid_in_L_15, credit_counter_out_15);
gen_random_packet(4, 4, 100, 15, 40, 8, 8, 10000 ns, clk, credit_counter_out_15, valid_in_L_15, RX_L_15);


-- connecting the packet receivers
get_packet(4, 32, 5, 0, clk, credit_in_L_0, valid_out_L_0,  TX_L_0);
get_packet(4, 32, 5, 1, clk, credit_in_L_1, valid_out_L_1,  TX_L_1);
get_packet(4, 32, 5, 2, clk, credit_in_L_2, valid_out_L_2,  TX_L_2);
get_packet(4, 32, 5, 3, clk, credit_in_L_3, valid_out_L_3,  TX_L_3);
get_packet(4, 32, 5, 4, clk, credit_in_L_4, valid_out_L_4,  TX_L_4);
get_packet(4, 32, 5, 5, clk, credit_in_L_5, valid_out_L_5,  TX_L_5);
get_packet(4, 32, 5, 6, clk, credit_in_L_6, valid_out_L_6,  TX_L_6);
get_packet(4, 32, 5, 7, clk, credit_in_L_7, valid_out_L_7,  TX_L_7);
get_packet(4, 32, 5, 8, clk, credit_in_L_8, valid_out_L_8,  TX_L_8);
get_packet(4, 32, 5, 9, clk, credit_in_L_9, valid_out_L_9,  TX_L_9);
get_packet(4, 32, 5, 10, clk, credit_in_L_10, valid_out_L_10,  TX_L_10);
get_packet(4, 32, 5, 11, clk, credit_in_L_11, valid_out_L_11,  TX_L_11);
get_packet(4, 32, 5, 12, clk, credit_in_L_12, valid_out_L_12,  TX_L_12);
get_packet(4, 32, 5, 13, clk, credit_in_L_13, valid_out_L_13,  TX_L_13);
get_packet(4, 32, 5, 14, clk, credit_in_L_14, valid_out_L_14,  TX_L_14);
get_packet(4, 32, 5, 15, clk, credit_in_L_15, valid_out_L_15,  TX_L_15);


end;
