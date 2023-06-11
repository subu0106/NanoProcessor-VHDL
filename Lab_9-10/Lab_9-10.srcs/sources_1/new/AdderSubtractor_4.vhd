----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 09:43:48 AM
-- Design Name: 
-- Module Name: AdderSubtractor_4 - Behavioral
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


entity AdderSubtractor_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           C_IN : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Zero: out STD_LOGIC;
           C_OUT : out STD_LOGIC);
end AdderSubtractor_4;

architecture Behavioral of AdderSubtractor_4 is
component FA
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_IN : in STD_LOGIC;
           S : out STD_LOGIC;
           C_OUT : out STD_LOGIC);
end component;

signal FA0_C, FA1_C, FA2_C, FA3_C, B0,B1,B2,B3: STD_LOGIC;
signal S_out:STD_LOGIC_VECTOR (3 downto 0);

begin

FA_0: FA
    PORT MAP(
        A=>A(0),
        B=>B0,
        C_IN=>C_IN,
        S=>S_out(0),
        C_OUT=>FA0_C);

FA_1: FA
    PORT MAP(
        A=>A(1),
        B=>B1,
        C_IN=>FA0_C,
        S=>S_out(1),
        C_OUT=>FA1_C);

FA_2: FA
    PORT MAP(
        A=>A(2),
        B=>B2,
        C_IN=>FA1_C,
        S=>S_out(2),
        C_OUT=>FA2_C);

FA_3: FA
    PORT MAP(
        A=>A(3),
        B=>B3,
        C_IN=>FA2_C,
        S=>S_out(3),
        C_OUT=>FA3_C);
       
       B0<=B(0) XOR C_IN; 
       B1<=B(1) XOR C_IN; 
       B2<=B(2) XOR C_IN; 
       B3<=B(3) XOR C_IN; 
       C_OUT<=FA3_C ;
       Zero<= NOT(S_out(0) OR S_out(1) OR S_out(2) OR S_out(3));
S<=S_out;
end Behavioral;