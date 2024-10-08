----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 06:08:58 PM
-- Design Name: 
-- Module Name: D_FF_EN - Behavioral
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

entity D_FF_EN is
    Port ( D : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           Qbar : out STD_LOGIC;
           En : in STD_LOGIC
           );
end D_FF_EN;

architecture Behavioral of D_FF_EN is
component D_FF
 port(
     D : in STD_LOGIC;
     Res : in STD_LOGIC;
     Clk : in STD_LOGIC;
     Q : out STD_LOGIC;
     Qbar : out STD_LOGIC
     );
end component;

signal D1: std_logic;
signal Q1 : std_logic;

begin
D_FF0: D_FF
 port map(
     D => D1,
     Res => Res,
     Q => Q1,
     Qbar => Qbar,
     Clk => Clk);
 
D1 <= (D and En) or (Q1 and (not En));
Q <= Q1;
end Behavioral;
