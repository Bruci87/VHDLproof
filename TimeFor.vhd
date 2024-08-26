library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;
entity dezena_min is
Port ( clk_in_dez_min: in std_logic;
	clk_out_dez_min : out  std_logic;
	bcd_dez_min : out  STD_LOGIC_vector (2 downto 0));
end dezena_min;
architecture Behavioral of dezena_min is
	signal dez:  std_logic_vector (2 downto 0):= "000";
	signal clk_out_tmp_min : std_logic := '0';
	begin
	process (clk_in_dez_min)
	begin
	IF (clk_in_dez_min = '1' and clk_in_dez_min'event) then
		dez <= dez + "1";
		IF (dez = 5) then
			dez <= "000";
			clk_out_tmp_min <= '1';
		end if;
			if (dez = 2) then
				clk_out_tmp_min <= '0';
			end if;
			end if;                                                                                                                                                 end process;
				bcd_dez_min <= dez;
				clk_out_dez_min <= clk_out_tmp_min;                     
end Behavioral;