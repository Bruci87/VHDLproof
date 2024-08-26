LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY testerelogio IS
END testerelogio;

ARCHITECTURE behavior OF testerelogio IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT relogio
    PORT(
         clk : IN  std_logic;
         seg71 : OUT  std_logic_vector(7 downto 0);
         seg72 : OUT  std_logic_vector(7 downto 0);
         seg73 : OUT  std_logic_vector(7 downto 0);
         seg74 : OUT  std_logic_vector(7 downto 0);
         seg75 : OUT  std_logic_vector(7 downto 0);
         seg76 : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
   

   --Inputs
   signal clk : std_logic := '0';

                --Outputs
   signal seg71 : std_logic_vector(7 downto 0);
   signal seg72 : std_logic_vector(7 downto 0);
   signal seg73 : std_logic_vector(7 downto 0);
   signal seg74 : std_logic_vector(7 downto 0);
   signal seg75 : std_logic_vector(7 downto 0);
   signal seg76 : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;

BEGIN

                -- Instantiate the Unit Under Test (UUT)
   uut: relogio PORT MAP (
          clk => clk,
          seg71 => seg71,
          seg72 => seg72,
          seg73 => seg73,
          seg74 => seg74,
          seg75 => seg75,
          seg76 => seg76
        );

   -- Clock process definitions
   clk_process :process
   begin
                               clk <= '0';
                               wait for clk_period/2;
                               clk <= '1';
                               wait for clk_period/2;
   end process;


   -- Stimulus process
   stim_proc: process
   begin                  
      -- hold reset state for 100 ns.
      wait for 100 ns;            

      wait for clk_period*10;

      -- insert stimulus here

      wait;
   end process;

END;