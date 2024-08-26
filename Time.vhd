library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;
entity Time is
	Port ( clk_in_uni_seg: in std_logic;
         clk_out_uni_seg: out  std_logic;
         bcd_uni_seg : out  STD_LOGIC_vector (3 downto 0));
end Time;

architecture Behavioral of Time is
	signal uni_seg:  std_logic_vector (3 downto 0):= "0000";
   signal clk_out_tmp_seg : std_logic := '0';
   begin
   process (clk_in_uni_seg)
   begin
   IF (clk_in_uni_seg = '1' and clk_in_uni_seg'event) then
       uni_seg <= uni_seg + "1";
       IF (uni_seg = 9) then
           uni_seg <= "0000";
           clk_out_tmp_seg <= '1';
       end if;
			IF (uni_seg = 5) then
             clk_out_tmp_seg <= '0';
         end if;
     end if;                                                                                                                                                               end process;
				bcd_uni_seg <= uni_seg;
            clk_out_uni_seg <= clk_out_tmp_seg;                        
end Behavioral;