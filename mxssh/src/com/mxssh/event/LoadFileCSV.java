package com.mxssh.event;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

public class LoadFileCSV {
	
	public List<String> execute(String filePath){
	    List<String> listServer = new ArrayList<String>();
	    
		FileReader input = null;
		try {
			input = new FileReader( filePath );
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} 
		
		BufferedReader bufRead = new BufferedReader(input);
		String line; // String that holds current file
		try {
			while ( ( line = bufRead.readLine())!=null ) {
				StringTokenizer token = new StringTokenizer(line,";");
				while(token.hasMoreTokens()){
					
				}
				line = line.trim();
				line = line.replace("\r", "");
				line = line.replace("\n", "");
				
			    listServer.add(line); 
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		try { 
			bufRead.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return listServer;
		
	}	


}
