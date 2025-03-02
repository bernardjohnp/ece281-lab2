----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2025 09:18:17 AM
-- Design Name: 
-- Module Name: sevenseg_decoder_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--INCLUDE LIBRARY FOR INT TO BINARY FUNCTION
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

--VISUALLY inspect to see if we can count from 0-16 in hex

--keep empty bc no external connections
entity sevenseg_decoder_tb is  
end sevenseg_decoder_tb;


architecture test_bench of sevenseg_decoder_tb is
    component sevenseg_decoder is
        port(
        i_Hex :  in std_logic_vector(3 downto 0);
        o_seg_n : out std_logic_vector(6 downto 0) --had to delete this semicolon with new library
        );
    end component; --NEED Semicolon here oops

    --declare signals
    signal w_Hex : std_logic_vector(3 downto 0);
    signal w_seg_n : std_logic_vector(6 downto 0);--same here

begin
    --same naming conv. as lab1
    sevenseg_decoder_inst : sevenseg_decoder 
    port map (
        i_Hex => w_Hex,
        o_seg_n => w_seg_n
    );
    
--actual test code
    test_process : process
    begin
    --loop through 0 to 15 for all 16 inputes
        for i in 0 to 15 loop
    -- i numbers will be integers but need to be 4-bit binary vector
    --instead of coding each individually, CONVERT to binary!!
    --looked up how to convert to binary
            w_Hex <= std_logic_vector(to_unsigned(i,4));
            wait for 20 ns;
            
        end loop; --need to end loop when reaches end
        
        wait; --in last lab
    end process;
    
end test_bench;
