----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 04:12:09 PM
-- Design Name: 
-- Module Name: Adder_3 - Behavioral
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

entity Adder_3 is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (2 downto 0));
end Adder_3;

architecture Behavioral of Adder_3 is

component FA
    port(
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        C_in : in STD_LOGIC;
        S : out STD_LOGIC;
        C_out : out STD_LOGIC
    );
end component;
signal FA0_C,FA1_C,c : STD_LOGIC;
begin
FA_0 :FA
    port map(
        A => A(0),
        B => B,
        C_in =>'0',
        S => S(0),
        C_out => FA0_C
        );
        
FA_1 :FA
    port map(
        A => A(1),
        B => '0',
        C_in =>FA0_C,
        S => S(1),
        C_out => FA1_C
        );
        
FA_2 :FA
    port map(
        A => A(2),
        B => '0',
        C_in =>FA1_C,
        S => S(2),
        C_out => c
        );
        
end Behavioral;