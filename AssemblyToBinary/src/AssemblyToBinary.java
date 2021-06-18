import java.util.*;
import java.io.*;

public class AssemblyToBinary {
	
	public static void main(String[] args) { 
		try  {  
			File assemblyFile = new File("assembly.txt");
			File binaryFile = new File("Memory.vhdl");
		 
			FileReader fr = new FileReader(assemblyFile);
			FileWriter fw = new FileWriter(binaryFile);
			
			BufferedReader br = new BufferedReader(fr);
//			BufferedWriter bw = new BufferedWriter(fw);
			
			String aLine = ""; 
			String lines = "";
			
			
			lines += "library IEEE;\r\n" + 
					"use IEEE.STD_LOGIC_1164.ALL;\r\n" + 
					"use IEEE.NUMERIC_STD.ALL;\r\n" + 
					"\r\n" + 
					"entity Memory is\r\n" + 
					"\tport( Address: in std_logic_vector(0 to 5);\r\n" + 
					"\t\t\tMData: out std_logic_vector(0 to 5) );\r\n" + 
					"end Memory;\r\n" + 
					"\r\n" + 
					"architecture Behavioral of Memory is\r\n" + 
					"type myType is array (0 to 63) of std_logic_vector(0 to 5);\r\n" + 
					"signal myMemory: myType;\r\n" + 
					"begin\r\n";
			
			int address = 0;
			while((aLine = br.readLine()) != null)  {
				
				String[] slice = aLine.split(" ");
				String slice0, slice1, slice2 = "";

				if(slice[0].equals("HLT")) {
					slice0 = "00";
					slice1 = "00";
					slice2 = "00";
					lines += "\t myMemory(" + address + ") <= \"" + slice0 + slice1 + slice2 + "\"; ";
					break;
				}
				else if(slice[0].equals("LOAD")) {
					slice0 = "00";
					slice2 = "11";
					if(slice[1].equals("R0,")) {
						slice1 = "00";
					}
					else if(slice[1].equals("R1,")) {
						slice1 = "01";
					}
					else if(slice[1].equals("R2,")) {
						slice1 = "10";
					}
					else if(slice[1].equals("R3,")) {
						slice1 = "11";
					}
					else {
						slice1 = "XX";
					}
					lines += "\t myMemory(" + address + ") <= \"" + slice0 + slice1 + slice2 + "\"; \n";
					address++;
					String number = Integer.toBinaryString( Integer.parseInt(slice[2]) );
					int size = number.length();
					String zeroes = "";
					while(6 - size > 0) {
						zeroes += "0";
						size++;
					}
					lines += "\t myMemory(" + address + ") <= \"" + zeroes + number + "\"; \n";
					address++;
				}
				else if(slice[0].equals("ADD")) {
					slice0 = "01";
					if(slice[1].equals("R0,")) {
						slice1 = "00";
					}
					else if(slice[1].equals("R1,")) {
						slice1 = "01";
					}
					else if(slice[1].equals("R2,")) {
						slice1 = "10";
					}
					else if(slice[1].equals("R3,")) {
						slice1 = "11";
					}
					else {
						slice1 = "XX";
					}
					if(slice[2].equals("R0")) {
						slice2 = "00";
					}
					else if(slice[2].equals("R1")) {
						slice2 = "01";
					}
					else if(slice[2].equals("R2")) {
						slice2 = "10";
					}
					else if(slice[2].equals("R3")) {
						slice2 = "11";
					}
					else {
						slice2 = "XX";
					}
					lines += "\t myMemory(" + address + ") <= \"" + slice0 + slice1 + slice2 + "\"; \n";
					address++;
				}
				else if(slice[0].equals("SUB")) {
					slice0 = "10";
					if(slice[1].equals("R0,")) {
						slice1 = "00";
					}
					else if(slice[1].equals("R1,")) {
						slice1 = "01";
					}
					else if(slice[1].equals("R2,")) {
						slice1 = "10";
					}
					else if(slice[1].equals("R3,")) {
						slice1 = "11";
					}
					else {
						slice1 = "XX";
					}
					if(slice[2].equals("R0")) {
						slice2 = "00";
					}
					else if(slice[2].equals("R1")) {
						slice2 = "01";
					}
					else if(slice[2].equals("R2")) {
						slice2 = "10";
					}
					else if(slice[2].equals("R3")) {
						slice2 = "11";
					}
					else {
						slice2 = "XX";
					}
					lines += "\t myMemory(" + address + ") <= \"" + slice0 + slice1 + slice2 + "\"; \n";
					address++;
				}
				else if(slice[0].equals("JNZ")) {
					slice0 = "11";
					slice2 = "11";
					if(slice[1].equals("R0,")) {
						slice1 = "00";
					}
					else if(slice[1].equals("R1,")) {
						slice1 = "01";
					}
					else if(slice[1].equals("R2,")) {
						slice1 = "10";
					}
					else if(slice[1].equals("R3,")) {
						slice1 = "11";
					}
					else {
						slice1 = "XX";
					}
					lines += "\t myMemory(" + address + ") <= \"" + slice0 + slice1 + slice2 + "\"; \n";
					address++;
					String number = Integer.toBinaryString( Integer.parseInt(slice[2]) );
					int size = number.length();
					String zeroes = "";
					while(6 - size > 0) {
						zeroes += "0";
						size++;
					}
					lines += "\t myMemory(" + address + ") <= \"" + zeroes + number + "\"; \n";
					address++;
				}
				
			}
			lines += "\r\n" + 
					"\tMData <= myMemory(to_integer(unsigned(Address)));\r\n" + 
					"end Behavioral;";
			fw.write(lines);
			
			fr.close();
			fw.close();
		}  
		catch(IOException e)  {  
			e.printStackTrace();  
		} 
	}	
}
