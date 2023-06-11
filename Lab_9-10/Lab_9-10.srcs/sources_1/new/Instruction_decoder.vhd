----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 06:17:20 PM
-- Design Name: 
-- Module Name: Instruction_decoder - Behavioral
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

entity Instruction_decoder is
    Port ( ROM_Instruction : in STD_LOGIC_VECTOR (11 downto 0); -- instruction from program ROM
           Check_Jump : in STD_LOGIC_VECTOR (3 downto 0);  -- register check for jump
           Select_A : out STD_LOGIC_VECTOR (2 downto 0);   --send the register to select to 1st MUX
           Select_B : out STD_LOGIC_VECTOR (2 downto 0);  --send the register to select to 1st MUX
           Enable_Register : out STD_LOGIC_VECTOR (2 downto 0);  --enable correct register
           AddSub : out STD_LOGIC; --if want to add enable 0, else if you want 2's complement enable 1
           Jump_Flag : out STD_LOGIC; --to indicate whether jump instruction is enabled or not
           Jump_Address : out STD_LOGIC_VECTOR (2 downto 0);  --address to which we need to jump
           LoadSelect : out STD_LOGIC;  --enable the mux connected to register bank
           Immediate_Value : out STD_LOGIC_VECTOR (3 downto 0));  --immediate value
end Instruction_decoder;

architecture Behavioral of Instruction_Decoder is

component Decoder_2_to_4
    Port ( I : in STD_LOGIC_VECTOR (1 downto 0);
           EN : in STD_LOGIC;
           D : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal ADD, NEG, MOVI, JZR :STD_LOGIC;

begin
    Decoder_2_to_4_0: Decoder_2_to_4
    port map(
    I(0)=>ROM_Instruction(10),
    I(1)=>ROM_Instruction(11),
    EN=>'1',
    D(0)=>ADD,
    D(1)=>NEG,
    D(2)=>MOVI,
    D(3)=>JZR
    );
    
Select_A <= ROM_Instruction(9 downto 7);
Select_B <= ROM_Instruction(6 downto 4);
Enable_Register <= ROM_Instruction(9 downto 7);
AddSub <= NEG ;
Jump_Flag <= JZR AND (NOT (Check_Jump(0) OR Check_Jump(1) OR Check_Jump(2) OR Check_Jump(3))) ;
Jump_Address <= ROM_Instruction(2 downto 0);
LoadSelect <= MOVI;
Immediate_Value <= ROM_Instruction(3 downto 0);


end Behavioral;