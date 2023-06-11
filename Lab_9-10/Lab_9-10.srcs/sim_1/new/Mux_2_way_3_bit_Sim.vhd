----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 05:06:20 PM
-- Design Name: 
-- Module Name: Mux_2_way_3_bit_Sim - Behavioral
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

entity Mux_2_way_3_bit_Sim is
--  Port ( );
end Mux_2_way_3_bit_Sim;

architecture Behavioral of Mux_2_way_3_bit_Sim is
COMPONENT Mux_2_way_3_bit
    Port ( IN0 : in STD_LOGIC_VECTOR (2 downto 0); 
           IN1 : in STD_LOGIC_VECTOR (2 downto 0);
           S : in STD_LOGIC; 
           OP : out STD_LOGIC_VECTOR (2 downto 0));
END COMPONENT;

SIGNAL IN0,IN1,OP :STD_LOGIC_VECTOR (2 downto 0);
SIGNAL S : STD_LOGIC; 

begin
UUT : Mux_2_way_3_bit
    PORT MAP(
            IN0 => IN0,
            IN1 => IN1,
            S => S,
            OP => OP       
            );
PROCESS
 BEGIN
    IN0 <= "000";
    IN1 <= "001";
    S <= '0';
    WAIT FOR 50ns;
    
    IN0 <= "100";
    IN1 <= "101";
    S <= '1';
    WAIT FOR 50ns;
    
    S <= '0';
    WAIT FOR 50ns;
    
    IN0 <= "110";
    IN1 <= "010";
    S <= '0';
    WAIT FOR 50ns;

END PROCESS;

end Behavioral;
