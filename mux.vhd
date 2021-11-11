library IEEE;
use IEEE.std_logic_1164.all;


entity mux is
	Port(
		mux_giris1:in std_logic_vector(3 downto 0);
		mux_giris2:in std_logic_vector(3 downto 0);
		s_in:in std_logic;
		cikis:out std_logic_vector(3 downto 0)
	);
end mux;

architecture Behavioral of mux is
begin
	process(s_in,mux_giris1,mux_giris2)
	   begin
		if s_in='0' then
			cikis <=mux_giris1;
	
		else 
			cikis <=mux_giris2;
		end if;
	end process;

end Behavioral;