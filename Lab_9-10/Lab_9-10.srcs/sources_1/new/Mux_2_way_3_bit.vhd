----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 04:29:42 PM
-- Design Name: 
-- Module Name: Mux_2_way_3_bit - Behavioral
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


entity Mux_2_way_3_bit is
    Port ( IN0 : in STD_LOGIC_VECTOR (2 downto 0); 
           IN1 : in STD_LOGIC_VECTOR (2 downto 0);
           S : in STD_LOGIC; 
           OP : out STD_LOGIC_VECTOR (2 downto 0)
           );
end Mux_2_way_3_bit;

architecture Behavioral of Mux_2_way_3_bit is
component Mux_2_to_1
    Port ( D0 : in STD_LOGIC;
           D1 : in STD_LOGIC;
           S : in STD_LOGIC;
           Y : out STD_LOGIC
           );
end component;

begin
Mux_2_to_1_0 :Mux_2_to_1
    port map( D0 => IN0(0),
              D1 => IN1(0),
              S => S,
              Y => OP(0) 
                );

Mux_2_to_1_1 :Mux_2_to_1
    port map( D0 => IN0(1),
              D1 => IN1(1),
              S => S,
              Y => OP(1)
                );
            
Mux_2_to_1_2 :Mux_2_to_1
    port map( D0 => IN0(2),
              D1 => IN1(2),
              S => S,
              Y => OP(2)
                );

end Behavioral;