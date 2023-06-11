----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/06/2023 10:03:01 PM
-- Design Name: 
-- Module Name: ProgramROM_Sim - Behavioral
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

entity ProgramROM_Sim is
--  Port ( );
end ProgramROM_Sim;

architecture Behavioral of ProgramROM_Sim is
component Program_Rom 
     Port ( MemoryAddress : in STD_LOGIC_VECTOR (2 downto 0);
          Instruction : out STD_LOGIC_VECTOR (11 downto 0));
end component;

signal Mem :STD_LOGIC_VECTOR (2 downto 0);
signal Ins :STD_LOGIC_VECTOR (11 downto 0);

begin
UUT : Program_Rom
    port map(
        MemoryAddress => Mem,
        Instruction => Ins
    );
process
    begin
    Mem <= "000";
    wait for 100ns;
    Mem <= "001";
    wait for 100ns;
    Mem <= "010";
    wait for 100ns;
    Mem <= "011";
    wait for 100ns;
    Mem <= "100";
    wait for 100ns;
    Mem <= "101";
    wait for 100ns;
    Mem <= "110";
    wait for 100ns;
    Mem <= "111";
    wait;
    
end process;

end Behavioral;
