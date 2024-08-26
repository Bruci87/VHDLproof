library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;
entity unidade_min is
Port ( clk_in_uni_min: in std_logic;
       clk_out_uni_min : out  std_logic;
        bcd_uni_min : out  STD_LOGIC_vector (3 downto 0));
end unidade_min;
architecture Behavioral of unidade_min is
	signal uni_min:  std_logic_vector (3 downto 0):= "0000";
   signal clk_out_tmp_min : std_logic := '0';
   begin
	process (clk_in_uni_min)
	begin
	IF (clk_in_uni_min = '1' and clk_in_uni_min'event) then
		uni_min <= uni_min + "1";
		IF (uni_min = 9) then
			uni_min <= "0000";
			clk_out_tmp_min <= '1';
		end if;
			if (uni_min = 5) then
				clk_out_tmp_min <= '0';
			end if;
				end if;                                                                                                 
				end process;
				bcd_uni_min <= uni_min;
				clk_out_uni_min <= clk_out_tmp_min;                     
end Behavioral;