library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	
entity eval is

generic(Nbits : natural := 18;   -- Estos 18 bits son de multiplicar 9bits*512, es decir, desplazo 9 lugares
		  Nbins : natural := 512);

port(	ECDF_exp : in  std_logic_vector(Nbits - 1 downto 0);
		ECDF_teo : in  std_logic_vector(Nbits - 1 downto 0);
		clk, rst : in  std_logic;
		     SAD : out std_logic_vector(Nbits - 1 downto 0)
		);
		
end entity;

architecture rtl of eval is
	
	signal error_reg : std_logic_vector(Nbits - 1 downto 0);
	signal 	  error : std_logic_vector(Nbits - 1 downto 0);
	
begin

	error <= std_logic_vector(abs(signed(ECDF_exp) - signed(ECDF_teo)) + signed(error_reg));
	
	process(ECDF_exp,ECDF_teo)
	begin
		if rst = '0' then
			error_reg <= (others => '0');
		elsif rising_edge(clk) then
			error_reg <= error;
		end if;
	end process;
	
	SAD <= error_reg;
	
end rtl;