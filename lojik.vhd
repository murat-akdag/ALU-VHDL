library IEEE;
use IEEE.std_logic_1164.all;


entity lojik is
	Port(
		lojik_giris1:in std_logic_vector(3 downto 0);
		lojik_giris2:in std_logic_vector(3 downto 0);
		lojik_cikis:out std_logic_vector(3 downto 0);
		lojik_s:in std_logic_vector(2 downto 0);
		loj_clk:in std_logic
	);
end lojik;

architecture Behavioral of lojik is

begin
	process(lojik_giris1,lojik_giris2,lojik_s,loj_clk)
	variable tampon: std_logic_vector(4 downto 0);
	   begin
		tampon:="00000";
		if rising_edge(loj_clk) then
			if lojik_s="000" then
				lojik_cikis <=lojik_giris1 and lojik_giris2;
	
			elsif lojik_s="001" then
				lojik_cikis <=lojik_giris1 or lojik_giris2;
			
			elsif lojik_s="010" then
				lojik_cikis <=lojik_giris1 xor lojik_giris2;
			
			elsif lojik_s="011" then
				lojik_cikis <=lojik_giris1 xnor lojik_giris2;
				
			elsif lojik_s="100" then --lojik_giris1 saga kaydirma
			   tampon:='0'& lojik_giris1;
				lojik_cikis <=tampon(4 downto 1);	
			
			elsif lojik_s="101" then --lojik_giris2 sola kaydirma
			   tampon:=lojik_giris2 &'0';
				lojik_cikis <=tampon(3 downto 0);
			else
				lojik_cikis<=lojik_giris1 nand lojik_giris2;
			
			end if;
		end if;
	end process;


end Behavioral;