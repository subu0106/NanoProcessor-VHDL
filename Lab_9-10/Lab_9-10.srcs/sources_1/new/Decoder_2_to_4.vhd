----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 04:55:28 PM
-- Design Name: 
-- Module Name: Decoder_2_to_4 - Behavioral
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

entity Decoder_2_to_4 is
    Port ( I : in STD_LOGIC_vector(1 downto 0);
           EN : in STD_LOGIC;
           D : out STD_LOGIC_VECTOR (3 downto 0)
           );
end Decoder_2_to_4;

architecture Behavioral of Decoder_2_to_4 is

begin

D(0)<=not(I(1)) and not(I(0)) and EN;
D(1)<=not(I(1)) and I(0) and EN;
D(2)<=I(1) and not(I(0)) and EN;
D(3)<=I(1) and I(0) and EN; 

end Behavioral;