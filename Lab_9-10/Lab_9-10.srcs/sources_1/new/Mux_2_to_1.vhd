----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 04:31:00 PM
-- Design Name: 
-- Module Name: Mux_2_to_1 - Behavioral
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

entity Mux_2_to_1 is
        Port ( D0 : in STD_LOGIC;
               D1 : in STD_LOGIC;
               S : in STD_LOGIC;
               Y : out STD_LOGIC);
end Mux_2_to_1;

architecture Behavioral of mux_2_to_1 is

begin
Y <= (D0 AND NOT(S)) OR (D1 AND S);
end Behavioral;
