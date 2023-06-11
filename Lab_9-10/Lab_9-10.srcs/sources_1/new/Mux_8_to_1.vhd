----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 04:41:19 PM
-- Design Name: 
-- Module Name: Mux_8_to_1 - Behavioral
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

entity Mux_8_to_1 is
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           D : in STD_LOGIC_VECTOR (7 downto 0);
           Y : out STD_LOGIC);
end Mux_8_to_1;

architecture Behavioral of Mux_8_to_1 is

COMPONENT Decoder_3_to_8
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           D : out STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT;

SIGNAL S0 : STD_LOGIC_VECTOR (2 downto 0);
SIGNAL Y0, F : STD_LOGIC_VECTOR (7 downto 0);

begin
    Decoder_3_to_8_0 : Decoder_3_to_8
        PORT MAP(
            I => S,
            D => Y0
        );

    F(0) <= D(0) AND Y0(0);
    F(1) <= D(1) AND Y0(1);
    F(2) <= D(2) AND Y0(2);
    F(3) <= D(3) AND Y0(3);
    F(4) <= D(4) AND Y0(4);
    F(5) <= D(5) AND Y0(5);
    F(6) <= D(6) AND Y0(6);
    F(7) <= D(7) AND Y0(7);
    
Y <=( F(0) OR F(1) OR F(2) OR F(3) OR F(4) OR F(5) OR F(6) OR F(7) );

end Behavioral;