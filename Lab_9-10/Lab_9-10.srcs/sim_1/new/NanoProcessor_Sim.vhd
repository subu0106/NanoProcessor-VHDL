----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/06/2023 10:04:33 PM
-- Design Name: 
-- Module Name: NanoProcessor_Sim - Behavioral
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

entity NanoProcessor_Sim is
--  Port ( );
end NanoProcessor_Sim;

architecture Behavioral of NanoProcessor_Sim is

component Nano_processor
 Port ( res : in STD_LOGIC;
        Clk_in : in std_logic;
        OvrFlw : out STD_LOGIC;
        Zero : out STD_LOGIC;
        R7LED : out STD_LOGIC_VECTOR (3 downto 0);
        sev_out : out STD_LOGIC_VECTOR (6 downto 0);
        minus_carry : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal res,OvrFlw,Zero:std_logic;
signal minus_carry : STD_LOGIC_VECTOR (3 downto 0);
signal R7LED:STD_LOGIC_VECTOR (3 downto 0);
signal sev_out:STD_LOGIC_VECTOR (6 downto 0);
signal Clk_in:std_logic:='0';
begin
UUT: Nano_processor
    port map(
        res=>res,
        Clk_in=>Clk_in,
        Ovrflw=>Ovrflw,
        Zero=>Zero,
        R7LED=>R7LED,
        sev_out=>sev_out,
        minus_carry=>minus_carry
        );
process
    begin
    wait for 5ns;
    Clk_in<=not(Clk_in);
end process;
process
    begin
    res<='1';
    wait for 100ns;
    res<='0';
    wait;
    
end process;
end Behavioral;
