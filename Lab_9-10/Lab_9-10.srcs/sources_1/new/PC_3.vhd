----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 05:45:25 PM
-- Design Name: 
-- Module Name: PC_3 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity PC_3 is
    Port ( Mux_out : in STD_LOGIC_VECTOR (2 downto 0):="000";--D
           Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Mem_s : out STD_LOGIC_VECTOR (2 downto 0));--Q
end PC_3;

architecture Behavioral of PC_3 is
component D_FF
    Port ( D : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           Qbar : out STD_LOGIC);
end component;
begin

D_FF0: D_FF
    port map(
    D=>Mux_out(0),
    Q=>Mem_s(0),
    Res=>Res,
    Clk=>clk
    );

D_FF1: D_FF
    port map(
    D=>Mux_out(1),
    Q=>Mem_s(1),
    Res=>Res,
    Clk=>clk
    );
    
D_FF2: D_FF
    port map(
    D=>Mux_out(2),
    Q=>Mem_s(2),
    Res=>Res,
    Clk=>clk
    );
    
end Behavioral;


