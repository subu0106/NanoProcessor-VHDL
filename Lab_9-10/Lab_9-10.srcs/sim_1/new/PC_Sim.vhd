----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/06/2023 10:00:57 PM
-- Design Name: 
-- Module Name: PC_Sim - Behavioral
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

entity PC_Sim is
--  Port ( );
end PC_Sim;

architecture Behavioral of PC_Sim is
Component PC_3
    Port ( Mux_out : in STD_LOGIC_VECTOR (2 downto 0):="000";--D
            Clk : in STD_LOGIC;
            Res : in STD_LOGIC;
            Mem_s : out STD_LOGIC_VECTOR (2 downto 0));--Q   
end component; 

signal Mux_out,Mem_s:std_logic_vector(2 downto 0);
signal Clk:std_logic:='0';
signal Res:std_logic;

begin
UUT: PC_3
    port map(
        Mux_out=>Mux_out,
        Clk=>Clk,
        Res=>Res,
        Mem_s=>Mem_s
    );
    
process
 begin
    wait for 20ns;
    Clk<=not(Clk);
end process;

process
 begin
    --wait for 20ns;
    Res<='1';
    wait for 40ns;
    Res<='0';
    Mux_out<="001";
    wait for 40ns;
    
    Mux_out<="010";
    wait for 40ns;
    
    mux_out<="011";
    wait for 40ns;
    
    Mux_out<="100";
    wait for 40ns;
    
    Mux_out<="101";
    wait for 40ns;
    
    Mux_out<="110";
    wait for 40ns;
    
    Mux_out<="111";
    wait for 40ns;
    
    Mux_out<="000";
    wait for 40ns;
    
    Mux_out<="001";
    wait for 40ns;
    
    Mux_out<="010";
    wait for 40ns;
    
    mux_out<="011";
    wait for 40ns;
    
    Res<='1';
    wait for 40ns;
    
    Res<='0';
    Mux_out<="001";
    wait for 40ns;
    
    Mux_out<="010";
    wait for 40ns;
    
    mux_out<="011";
    wait;
    
end process;

end Behavioral;