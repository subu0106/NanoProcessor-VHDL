----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/06/2023 09:59:15 PM
-- Design Name: 
-- Module Name: AdderSubtractor_Sim - Behavioral
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

entity AdderSubtractor_Sim is
--  Port ( );
end AdderSubtractor_Sim;

architecture Behavioral of AdderSubtractor_Sim is
component AdderSubtractor_4
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           C_IN : in STD_LOGIC;
           S : inout STD_LOGIC_VECTOR (3 downto 0);
           Zero: out STD_LOGIC;
           C_OUT : out STD_LOGIC);
end component;

signal A,B,S : STD_LOGIC_VECTOR (3 downto 0);
signal SET, OVERFLOW, ZERO : STD_LOGIC;

begin
UUT: AdderSubtractor_4
    PORT MAP(
    A=>A,
    B=>B,
    C_IN=>SET,
    S=>S,
    Zero=>ZERO,
    C_OUT=>OVERFLOW);
    
    PROCESS
    BEGIN
--    index number= 210621R
--    Binary form= 0011 0011 0110 1011 1101

    
    SET<='0';
    A<="0011";
    B<="0011";
    WAIT FOR 100NS;
       
    SET<='0';
    A<="0011";
    B<="0110";
    WAIT FOR 100NS;
       
    SET<='0';
    A<="0110";
    B<="1011";
    WAIT FOR 100NS;
      
    SET<='0';
    A<="1011";
    B<="1101";
    WAIT FOR 100NS;
    
    SET<='1';
    A<="0011";
    B<="0011";
    WAIT FOR 100NS;
       
    SET<='1';
    A<="0011";
    B<="0110";
    WAIT FOR 100NS;
       
    SET<='1';
    A<="0110";
    B<="1011";
    WAIT FOR 100NS;
      
    SET<='1';
    A<="1011";
    B<="1101";
    WAIT FOR 100NS;
    WAIT;
    END PROCESS;
end Behavioral;