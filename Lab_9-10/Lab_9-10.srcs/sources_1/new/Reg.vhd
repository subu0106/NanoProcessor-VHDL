----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 06:06:07 PM
-- Design Name: 
-- Module Name: Reg - Behavioral
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

entity Reg is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC
           );
end Reg;

architecture Behavioral of REG is
component D_FF_EN
    Port ( D : in STD_LOGIC;
       Res : in STD_LOGIC;
       Clk : in STD_LOGIC;
       Q : out STD_LOGIC;
       Qbar : out STD_LOGIC;
       En : in STD_LOGIC
       );
end component;
begin
D_FF_EN0 : D_FF_EN 
port map(
     D => D(0),
     En => En,
     Clk => Clk,
     Res => Res,
     Q => Q(0)
     );
     
D_FF_EN1 : D_FF_EN 
port map(
     D => D(1),
     En => En,
     Clk => Clk,
     Res => Res,
     Q => Q(1)
     ); 
     
D_FF_EN2 : D_FF_EN 
 port map(
     D => D(2),
     En => En,
     Clk => Clk,
     Res => Res,
     Q => Q(2)
     );
     
D_FF_EN3 : D_FF_EN 
 port map(
     D => D(3),
     En => En,
     Clk => Clk,
     Res => Res,
     Q => Q(3)
     );
     
end Behavioral;