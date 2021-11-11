library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_SIGNED.ALL; 

entity aritmetik is
	Port(
		ar_giris1:in std_logic_vector(3 downto 0);
		ar_giris2:in std_logic_vector(3 downto 0);
		ar_cikis:out std_logic_vector(3 downto 0);
		ar_s:in std_logic_vector(1 downto 0);
		cout:out std_logic;
		ar_clk:in std_logic
	);
end aritmetik;

architecture Behavioral of aritmetik is
begin
	process(ar_giris1,ar_giris2,ar_s,ar_clk)
	variable tampon: std_logic_vector(4 downto 0);
	   begin
		tampon:="00000";
		if rising_edge(ar_clk) then
			if ar_s="00" then
				tampon :=('0'& ar_giris1) + ('0'& ar_giris2);
				ar_cikis<=tampon(3 downto 0);
				cout<=tampon(4);
	
			elsif ar_s="01" then
				ar_cikis <=ar_giris1 - ar_giris2;
			
			elsif ar_s="10" then
				tampon :=('0'& ar_giris1)+1;
				ar_cikis<=tampon(3 downto 0);
				cout<=tampon(4);
			else
				tampon  :=('0'& ar_giris2) +1;
				ar_cikis<=tampon(3 downto 0);
				cout<=tampon(4);
			
			end if;
	end if;
	end process;


end Behavioral;