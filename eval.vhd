library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	
entity eval is

generic (N_ECDF : natural := 16);

port(	ECDF_exp : in  std_logic_vector(N_ECDF - 1 downto 0);
		ECDF_teo : in  std_logic_vector(N_ECDF - 1 downto 0);
		error    : out std_logic_vector(N_ECDF - 1 downto 0)
		);
		
end entity;

architecture rtl of eval is

begin

	error <= std_logic_vector(abs(signed(ECDF_exp) - signed(ECDF_teo)));

end rtl;