----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 06:30:11 PM
-- Design Name: 
-- Module Name: Nano_processor - Behavioral
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

entity Nano_processor is
 Port (  res : in STD_LOGIC;
         Clk_in : in std_logic;
         OvrFlw : out STD_LOGIC;
         Zero : out STD_LOGIC;
         R7LED : out STD_LOGIC_VECTOR (3 downto 0);
         sev_out : out STD_LOGIC_VECTOR (6 downto 0);
         minus_carry: out STD_LOGIC_VECTOR(3 downto 0)
         );
end Nano_processor;

architecture Behavioral of Nano_processor is

component Instruction_decoder  
 port(
     ROM_Instruction : in STD_LOGIC_VECTOR (11 downto 0);
     Select_A : out STD_LOGIC_VECTOR (2 downto 0);
     Select_B : out STD_LOGIC_VECTOR (2 downto 0);
     Enable_Register : out STD_LOGIC_VECTOR (2 downto 0);
     Immediate_Value : out STD_LOGIC_VECTOR (3 downto 0);
     LoadSelect : out STD_LOGIC;
     AddSub : out STD_LOGIC;
     Jump_Flag : out STD_LOGIC;
     Jump_Address : out std_logic_vector (2 downto 0); 
     Check_Jump : in STD_LOGIC_VECTOR (3 downto 0));
end component;

component Program_ROM  
port(
     MemoryAddress : in STD_LOGIC_VECTOR (2 downto 0);
     Instruction: out STD_LOGIC_VECTOR (11 downto 0));
end component;

component Adder_3 --3bit Adder
    port(
         A : in STD_LOGIC_VECTOR (2 downto 0);
         S : out STD_LOGIC_VECTOR (2 downto 0);
         B : in std_logic);
end component;

component PC_3   
    port(Mux_out : in STD_LOGIC_VECTOR (2 downto 0);
        Mem_S : out STD_LOGIC_VECTOR (2 downto 0);
        Res : in STD_LOGIC;
        Clk : in STD_LOGIC);
end component;


component Mux_2_way_3_bit 
port(
     S : in STD_LOGIC;
     IN0 : in STD_LOGIC_VECTOR (2 downto 0);
     IN1 : in STD_LOGIC_VECTOR (2 downto 0);
     OP : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Mux_2_way_4_bit 
port(
     S : in STD_LOGIC;
     IN0 : in STD_LOGIC_VECTOR (3 downto 0);
     IN1 : in STD_LOGIC_VECTOR (3 downto 0);
     OP : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Mux_8_way_4_bit    
 port( 
    S : in STD_LOGIC_VECTOR (2 downto 0);
    IN0 : in STD_LOGIC_VECTOR (3 downto 0);
    IN1 : in STD_LOGIC_VECTOR (3 downto 0);
    IN2 : in STD_LOGIC_VECTOR (3 downto 0);
    IN3 : in STD_LOGIC_VECTOR (3 downto 0);
    IN4 : in STD_LOGIC_VECTOR (3 downto 0);
    IN5 : in STD_LOGIC_VECTOR (3 downto 0);
    IN6 : in STD_LOGIC_VECTOR (3 downto 0);
    IN7 : in STD_LOGIC_VECTOR (3 downto 0);
    OP : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component AdderSubtractor_4  --Adder Substractor(4bit)
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           C_IN : in STD_LOGIC;
           S : inout STD_LOGIC_VECTOR (3 downto 0);
           Zero: out STD_LOGIC;
           C_OUT : out STD_LOGIC);
end component;

component Register_bank 
port(
     clk  : in STD_LOGIC;
     sel  : in STD_LOGIC_VECTOR (2 downto 0);
     data : in STD_LOGIC_VECTOR (3 downto 0);
     res  : in STD_LOGIC;
     out0 : out STD_LOGIC_VECTOR (3 downto 0);
     out1 : out STD_LOGIC_VECTOR (3 downto 0);
     out2 : out STD_LOGIC_VECTOR (3 downto 0);
     out3 : out STD_LOGIC_VECTOR (3 downto 0);
     out4 : out STD_LOGIC_VECTOR (3 downto 0);
     out5 : out STD_LOGIC_VECTOR (3 downto 0);
     out6 : out STD_LOGIC_VECTOR (3 downto 0);
     out7 : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Slow_Clock  
 port(
    clk_in : in STD_LOGIC;
    clk_out : out STD_LOGIC);
end component;

component Seven_Segment --7Segement 
port(
    number : in STD_LOGIC_VECTOR (3 downto 0);
    output : out STD_LOGIC_VECTOR (6 downto 0));
end component;

signal slw_clk,OvrFlw0 : std_logic; 
signal ProgramCounterOut : STD_LOGIC_VECTOR (2 downto 0); 
signal RCA_3_bit_Out : std_logic_vector (2 downto 0); -- send to 2_way 3_bit mux
signal two_way_mux_out : std_logic_vector (2 downto 0); -- send to program counter
signal ROM_OUT : std_logic_vector (11 downto 0); -- send to instruction Decoder

--ROM signals
signal regSelmuxA,decoderVal,regSelmuxB,addressJMP : STD_LOGIC_VECTOR (2 downto 0);
signal Immediate_Value : STD_LOGIC_VECTOR (3 downto 0);
signal loadSel,addOrSub,jmpFlag : STD_LOGIC;

--Registers' signal and MUX output
signal REGI_0,REGI_1,REGI_2,REGI_3,REGI_4,REGI_5,REGI_6,REGI_7,MUX_A,MUX_B,MUX_2_to_1_out,RCA_out : STD_LOGIC_VECTOR (3 downto 0); 
begin
--Mapping Start

Slow_Clock_0 : Slow_Clock  
 port map(clk_in => Clk_in,
          clk_out => slw_clk);
          
PC_0 : PC_3  --Program counter
 port map (Mux_out=>two_way_mux_out,
           Mem_S=> ProgramCounterOut,
           res => res,
           Clk => slw_clk);
           
Adder_3_0 : Adder_3  
 port map(
     A => ProgramCounterOut,
     S => RCA_3_bit_Out,
     B => '1'); 
     
Mux_2_way_3_bit_0 : Mux_2_way_3_bit
 port map(
     S => jmpFlag,
     IN0 => RCA_3_bit_Out,
     IN1 => addressJMP,
     OP => two_way_mux_out);
     
ROMS : Program_ROM
 port map(
 MemoryAddress => ProgramCounterOut,
 Instruction => ROM_OUT
 ); 

InstructionDecoder0: Instruction_Decoder
  port map(
     ROM_Instruction => ROM_OUT,
     Select_A => regSelmuxA,
     Select_B => regSelmuxB,
     Enable_Register => decoderVal,
     Immediate_Value => Immediate_Value,
     LoadSelect => loadSel,
     AddSub => addOrSub,
     Jump_Flag => jmpFlag,
     Jump_Address => addressJMP,
     Check_Jump => MUX_A);

Reg_bank0: Register_bank
 port map( clk => slw_clk,
           sel => decoderVal,
           data => MUX_2_to_1_out,
           res => res,
           out0 => REGI_0,
           out1 => REGI_1,
           out2 => REGI_2,
           out3 => REGI_3,
           out4 => REGI_4,
           out5 => REGI_5,
           out6 => REGI_6,
           out7 => REGI_7); 
           
Mux_8_way_4_bit_A : Mux_8_way_4_bit
 port map(
 S => regSelmuxA,
 IN0 => REGI_0,
 IN1 => REGI_1,
 IN2 => REGI_2,
 IN3 => REGI_3,
 IN4 => REGI_4,
 IN5 => REGI_5,
 IN6 => REGI_6,
 IN7 => REGI_7,
 OP => MUX_A
 );
  
Mux_8_way_4_bit_B : Mux_8_way_4_bit
 port map(
 S => regSelmuxB,
 IN0 => REGI_0,
 IN1 => REGI_1,
 IN2 => REGI_2,
 IN3 => REGI_3,
 IN4 => REGI_4,
 IN5 => REGI_5,
 IN6 => REGI_6,
 IN7 => REGI_7,
 OP => MUX_B
 );

Mux_2_way_4_bit_0 : Mux_2_way_4_bit
    port map(
         S => loadSel,
         IN0 => RCA_out,
         IN1 => Immediate_Value,
         OP => MUX_2_to_1_out); 
         
RCA_0 : AdderSubtractor_4
 port map(
 A => MUX_B,
 B => MUX_A,
 C_IN => addOrSub,
 C_OUT => OvrFlw0,
 S => RCA_out,
 Zero => Zero
 ); 
 
svenSeg_0 : Seven_Segment
 port map(
 number => REGI_7,
 output => sev_out );
 
R7LED <= REGI_7;
OvrFlw <= OvrFlw0;
minus_carry<= "1110";
end Behavioral;
