library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;

entity relogio is
    port (clk : in std_logic;
	 seg71: out std_logic_vector (7 downto 0);
    seg72: out std_logic_vector (7 downto 0);
    seg73: out std_logic_vector (7 downto 0);
    seg74: out std_logic_vector (7 downto 0);
    seg75: out std_logic_vector (7 downto 0);
    seg76: out std_logic_vector (7 downto 0));
end relogio;
	architecture Behavioral of relogio is
   signal bcduniseg :   STD_LOGIC_vector (3 downto 0);
   signal bcddezseg :   STD_LOGIC_vector (2 downto 0);
   signal bcdunimin :   STD_LOGIC_vector (3 downto 0);
   signal bcddezmin :   STD_LOGIC_vector (2 downto 0);
   signal bcdunihr :  STD_LOGIC_vector (2 downto 0);
   signal bcddezhora :   STD_LOGIC_vector (1 downto 0);
   signal clock : std_logic_vector (5 downto 1);
--                                         segmento mostrador:              abcdefgh (h=ponto)
constant num0: STD_LOGIC_vector (7 downto 0) := "00000011"; -- codigo numero 0
constant num1: STD_LOGIC_vector (7 downto 0) := "10011111"; -- codigo numero 1
constant num2: STD_LOGIC_vector (7 downto 0) := "00100101"; -- codigo numero 2
constant num3: STD_LOGIC_vector (7 downto 0) := "00001101"; -- codigo numero 3
constant num4: STD_LOGIC_vector (7 downto 0) := "10011001"; -- codigo numero 4
constant num5: STD_LOGIC_vector (7 downto 0) := "01001001"; -- codigo numero 5
constant num6: STD_LOGIC_vector (7 downto 0) := "11000001"; -- codigo numero 6
constant num7: STD_LOGIC_vector (7 downto 0) := "00011111"; -- codigo numero 7
constant num8: STD_LOGIC_vector (7 downto 0) := "00000001"; -- codigo numero 8
constant num9: STD_LOGIC_vector (7 downto 0) := "00011001"; -- codigo numero 9
constant numn: STD_LOGIC_vector (7 downto 0) := "11111111"; -- apaga tudo
component unidade_seg is
	Port ( clk_in_uni_seg: in std_logic;
		clk_out_uni_seg: out  std_logic;
      bcd_uni_seg : out  STD_LOGIC_vector (3 downto 0));
end component;
component dezena_seg is
	Port ( clk_in_dez_seg: in std_logic;
		clk_out_dez_seg : out  std_logic;
      bcd_dez_seg : out  STD_LOGIC_vector (2 downto 0));
end component;                
component unidade_min is
	Port ( clk_in_uni_min: in std_logic;
		clk_out_uni_min : out  std_logic;
      bcd_uni_min : out  STD_LOGIC_vector (3 downto 0));
   end component;                                
		component dezena_min is
		Port ( clk_in_dez_min: in std_logic;
			clk_out_dez_min : out  std_logic;
         bcd_dez_min : out  STD_LOGIC_vector (2 downto 0));
end component;                                              
component unihora is
	Port ( clk_in_uni_hr: in std_logic;
		clk_out_uni_hr : out  std_logic;
      bcd_uni_hr : out  STD_LOGIC_vector (2 downto 0));
   end component;
component dezhora is
	Port ( clk_in_dez_hora: in std_logic;
		bcd_dez_hora : out  STD_LOGIC_vector (1 downto 0));
end component;
	begin                                    
		u1: unidade_seg port map(clk, clock(1), bcduniseg);
      u2: dezena_seg port map (clock(1), clock(2), bcddezseg);
      u3: unidade_min port map(clock(2), clock(3), bcdunimin);
      u4: dezena_min port map (clock(3), clock(4), bcddezmin);
      u5: unihora port map(clock(4), clock(5), bcdunihr);
      u6: dezhora port map (clock(5), bcddezhora);                                        
		table_useg: block
      begin
			seg71 <= num0 when bcduniseg = 0 else
          num1 when bcduniseg = 1 else
          num2 when bcduniseg = 2 else
          num3 when bcduniseg = 3 else
          num4 when bcduniseg = 4 else
          num5 when bcduniseg = 5 else
          num6 when bcduniseg = 6 else
          num7 when bcduniseg = 7 else
          num8 when bcduniseg = 8 else
          num9 when bcduniseg = 9 else
          numn;
      end block table_useg;
			table_dseg: block
         begin
				seg72 <=num0 when bcddezseg = 0 else
            num1 when bcddezseg = 1 else
            num2 when bcddezseg = 2 else
            num3 when bcddezseg = 3 else
            num4 when bcddezseg = 4 else
            num5 when bcddezseg = 5 else
            num6 when bcddezseg = 6 else
            num7 when bcddezseg = 7 else
            num8 when bcddezseg = 8 else
            num9 when bcddezseg = 9 else
            numn;
					end block table_dseg;                               
               table_unimin: block
					begin
					seg73 <=num0 when bcdunimin = 0 else
                num1 when bcdunimin = 1 else
                num2 when bcdunimin = 2 else
                num3 when bcdunimin = 3 else
                num4 when bcdunimin = 4 else
                num5 when bcdunimin = 5 else
                num6 when bcdunimin = 6 else
                num7 when bcdunimin = 7 else
                num8 when bcdunimin = 8 else
                num9 when bcdunimin = 9 else
                numn;
					 end block table_unimin;
					 table_dezmin: block
					  begin
                 seg74 <=num0 when bcddezmin = 0 else
					  num1 when bcddezmin = 1 else
                 num2 when bcddezmin = 2 else
                 num3 when bcddezmin = 3 else
                 num4 when bcddezmin = 4 else
                 num5 when bcddezmin = 5 else
                 num6 when bcddezmin = 6 else
                 num7 when bcddezmin = 7 else
                 num8 when bcddezmin = 8 else
                 num9 when bcddezmin = 9 else
                 numn;
                 end block table_dezmin;                             
					  table_unihr: block
                 begin
                 seg75 <=num0 when bcdunihr = 0 else
                 num1 when bcdunihr = 1 else
                 num2 when bcdunihr = 2 else
                 num3 when bcdunihr = 3 else
                 num4 when bcdunihr = 4 else
                 numn;
                 end block table_unihr;
                 table_dezhr: block
                 begin
                 seg76 <=num0 when bcddezhora = 0 else
                 num1 when bcddezhora = 1 else
                 num2 when bcddezhora = 2 else
                 numn;
                 end block table_dezhr;
           end Behavioral;