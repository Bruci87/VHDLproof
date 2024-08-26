library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;
entity dezena_seg is
Port ( clk_in_dez_seg: in std_logic;
       clk_out_dez_seg : out  std_logic;
        bcd_dez_seg : out  STD_LOGIC_vector (2 downto 0));
end dezena_seg;
architecture Behavioral of dezena_seg is
	signal dez:  std_logic_vector (2 downto 0):= "000";
   signal clk_out_tmp_seg : std_logic := '0';
   begin
   process (clk_in_dez_seg)
   begin
   IF (clk_in_dez_seg = '1' and clk_in_dez_seg'event) then
       dez <= dez + "1";
       IF (dez = 5) then
           dez <= "000";
           clk_out_tmp_seg <= '1';
       end if;
           if (dez = 2) then
					clk_out_tmp_seg <= '0';
           end if;
    end if;                                                                                                                                                                 end process;
         bcd_dez_seg <= dez;
         clk_out_dez_seg <= clk_out_tmp_seg;                       
end Behavioral;