----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/06/2023 09:57:04 PM
-- Design Name: 
-- Module Name: InstructionDecoder_Sim - Behavioral
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


entity InstructionDecoder_Sim is
--  Port ( );
end InstructionDecoder_Sim;

architecture Behavioral of InstructionDecoder_Sim is
component Instruction_decoder
    Port ( ROM_Instruction : in STD_LOGIC_VECTOR (11 downto 0);
           Check_Jump : in STD_LOGIC_VECTOR (3 downto 0);
           Select_A : out STD_LOGIC_VECTOR (2 downto 0);
           Select_B : out STD_LOGIC_VECTOR (2 downto 0);
           Enable_Register : out STD_LOGIC_VECTOR (2 downto 0);
           AddSub : out STD_LOGIC;
           Jump_Flag : out STD_LOGIC;
           Jump_Address : out STD_LOGIC_VECTOR (2 downto 0);
           LoadSelect : out STD_LOGIC;
           Immediate_Value : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal ROM_Instruction : STD_LOGIC_VECTOR (11 downto 0);
signal Check_Jump, Immediate_Value : STD_LOGIC_VECTOR (3 downto 0);
signal Select_A, Select_B, Enable_Register, Jump_Address : STD_LOGIC_VECTOR (2 downto 0);
signal AddSub, Jump_Flag,LoadSelect : STD_LOGIC;

begin
UUT: Instruction_decoder 
    PORT MAP(  ROM_Instruction=>ROM_Instruction,
               Check_Jump=>Check_Jump,
               Select_A=>Select_A,
               Select_B =>Select_B,
               Enable_Register=>Enable_Register,
               AddSub=>AddSub,
               Jump_Flag=>Jump_Flag,
               Jump_Address=>Jump_Address,
               LoadSelect=>LoadSelect,
               Immediate_Value=>Immediate_Value
    );

process
begin
    Check_Jump<="1110";
    ROM_Instruction<="001011110000"; 
    wait for 50ns; 
    
    Check_Jump<="1010";
    ROM_Instruction<="011110000000"; 
    wait for 50ns; 

    Check_Jump<="1011";
    ROM_Instruction<="101100000111"; 
    wait for 50ns;
    
    Check_Jump<="0000";
    ROM_Instruction<="110110000100"; 
    wait for 50ns; 
    
    Check_Jump<="1010";
    ROM_Instruction<="111110000100"; 
    
    wait for 50ns;  
wait;

end process;
end Behavioral;
