----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 06:12:11 PM
-- Design Name: 
-- Module Name: Program_ROM - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity Program_ROM is
    Port ( MemoryAddress : in STD_LOGIC_VECTOR (2 downto 0);
           Instruction : out STD_LOGIC_VECTOR (11 downto 0));
end Program_ROM;

architecture Behavioral of Program_ROM is
type rom_type is array (0 to 7) of STD_LOGIC_VECTOR( 11 downto 0);
signal instructionROM : rom_type := (
                          
    ----Count 10 to 0    
    --"100010001010", --0  Move R1 10s
    --"100100000001", --1  Move R2 01
    --"010100000000", --2  Neg R2
    --"000010100000", --3  R1<- R1+R2
    --"110010000111", --4  JMP R1=0 PR7
    --"110000000011", --5  JMP R0=0 PR3
    --"110010000111", --6
    --"110010000110"  --7   
    
    
        --Add 1,2,3
        "101110000001", -- 0-- MOVI R7,1
        "101100000010", -- 1-- MOVI R6,2
        "101010000011", -- 2-- MOVI R5,3
        "001111100000", -- 3-- ADD R7,R6
        "001111010000", -- 4-- ADD R7,R5
        "110000000110", -- 5-- JZR R0,1
        "110000000101", -- 6-- JZR R1,3
        "110000000101"  -- 7-- JZR R5,7                 
);
 
begin
Instruction <= instructionROM(to_integer(unsigned(MemoryAddress))); 

end Behavioral;