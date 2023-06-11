----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 04:51:28 PM
-- Design Name: 
-- Module Name: Decoder_3_to_8 - Behavioral
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

entity Decoder_3_to_8 is
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           D : out STD_LOGIC_VECTOR (7 downto 0));
end Decoder_3_to_8;

architecture Behavioral of Decoder_3_to_8 is
component Decoder_2_to_4
    Port ( I : in STD_LOGIC_vector(1 downto 0);
           EN : in STD_LOGIC;
           D : out STD_LOGIC_VECTOR (3 downto 0)
           );  
end component;
signal EN0,EN1,EN:std_logic;
begin
Decoder_2_to_40:Decoder_2_to_4
        port map(I=>I(1 downto 0),
                EN=>EN0,
                D=>D(3 downto 0)
                );
                
Decoder_2_to_41:Decoder_2_to_4
            port map(I=>I(1 downto 0),
                     EN=>EN1,
                     D=>D(7 downto 4)
                     );
EN<='1';
EN0<=EN and not(I(2));
EN1<=EN and I(2);

end Behavioral;