import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

public class CSVWriter
{
	private static ArrayList<Record> tuples = new ArrayList<Record>();

	public static void main(String[] args)
	{
		generateRandomCompCount();
		writeToCSV();
	}

	public static void generateRandomCompCount()
	{
		Random rand = new Random();
		int r = 0;
		for(int yr = 2007; yr <= 2014; yr++)
		{
			for(int div = 1; div <= 207; div++)
			{
				for(int race = 1; race <= 7; race++)
				{
					for(int prgNum = 0; prgNum < 12; prgNum++)
					{
						r = rand.nextInt(30) + 0;
						switch (prgNum)
						{
							case 0: tuples.add(new Record(yr, div, "" + race, 3114, r)); break;
							case 1: tuples.add(new Record(yr, div, "" + race, 3101, r)); break;
              case 2: tuples.add(new Record(yr, div, "" + race, 3102, r)); break;
              case 3: tuples.add(new Record(yr, div, "" + race, 3103, r)); break;
              case 4: tuples.add(new Record(yr, div, "" + race, 3105, r)); break;
              case 5: tuples.add(new Record(yr, div, "" + race, 3106, r)); break;
              case 6: tuples.add(new Record(yr, div, "" + race, 3108, r)); break;
              case 7: tuples.add(new Record(yr, div, "" + race, 3115, r)); break;
              case 8: tuples.add(new Record(yr, div, "" + race, 3113, r)); break;
              case 9: tuples.add(new Record(yr, div, "" + race, 3109, r)); break;
              case 10: tuples.add(new Record(yr, div, "" + race, 3116, r)); break;
              case 11: tuples.add(new Record(yr, div, "" + race, 3111, r)); break;
						}
					}
				}
			}
		}
	}


	public static void writeToCSV()
	{
		FileWriter fw = null;

		try
		{
			fw = new FileWriter("fake_cte_completer.csv");
			
			for(Record r: tuples)
			{
				fw.append("" + r.getYear());
				fw.append(",");
        fw.append("" + r.getDiv());
        fw.append(",");
        fw.append("0");
        fw.append(",");
        fw.append(r.getRace());
        fw.append(",");
        fw.append("ALL");
        fw.append(",");
        fw.append("ALL");
        fw.append(",");
        fw.append("ALL");
        fw.append(",");
        fw.append("ALL");
        fw.append(",");
        fw.append("" + r.getPrgNum());
        fw.append(",");
        fw.append("" + r.getCompCnt());
				fw.append("\n");
			}

			System.out.println("CSV written successfully");
		}catch(Exception e) {
			System.out.println("Problem writing to csv.");
		}

		try {
			fw.flush();
			fw.close();
		}catch(Exception e) {
			System.out.println("Error");
		}

	}
}
