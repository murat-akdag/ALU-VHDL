library IEEE;
use IEEE.std_logic_1164.all;


entity ALU is
	Port(
		giris_1:in std_logic_vector(3 downto 0);
		giris_2:in std_logic_vector(3 downto 0);
		cikis_elde:out std_logic;
		alu_cikis:out std_logic_vector(3 downto 0);
		s_giris: in std_logic_vector(3 downto 0);
		clock:in std_logic
		);
end ALU;

architecture Behavioral of ALU is
COMPONENT lojik is PORT(
		lojik_giris1:in std_logic_vector(3 downto 0);
		lojik_giris2:in std_logic_vector(3 downto 0);
		lojik_cikis:out std_logic_vector(3 downto 0);
		lojik_s:in std_logic_vector(2 downto 0);
		loj_clk:in std_logic
		);
END COMPONENT;

COMPONENT aritmetik is PORT(
		ar_giris1:in std_logic_vector(3 downto 0);
		ar_giris2:in std_logic_vector(3 downto 0);
		ar_cikis:out std_logic_vector(3 downto 0);
		ar_s:in std_logic_vector(1 downto 0);
		cout:out std_logic;
		ar_clk:in std_logic	
		);
END COMPONENT;

COMPONENT mux is PORT(
		mux_giris1:in std_logic_vector(3 downto 0);
		mux_giris2:in std_logic_vector(3 downto 0);
		s_in:in std_logic;
		cikis:out std_logic_vector(3 downto 0)
		);
END COMPONENT;

		signal l_cikis:std_logic_vector(3 downto 0);
		signal a_cikis:std_logic_vector(3 downto 0);
		signal c_out:std_logic;


	begin
		u1: aritmetik port map (giris_1,giris_2,a_cikis,s_giris(1 downto 0),c_out,clock);
		u2: lojik port map (giris_1,giris_2,l_cikis,s_giris(2 downto 0),clock);
		u3: mux port map (a_cikis,l_cikis,s_giris(3),alu_cikis);
		cikis_elde<=c_out;
end Behavioral;