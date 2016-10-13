<%@page import="java.util.*, db.*" %>
<!DOCTYPE html>
<html>
<title>Health4VA | Graphs</title>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800" rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body>
<div id="header-wrapper">
	<div id="header" class="container">
		<div id="logo">
			<h1><a href="#">Health4VA</a></h1>
		</div>
		<div id="menu">
			<ul>
				<li><a href="index.html" title="">Home</a></li>
				<li><a href="highlights.html" title="">Highlights</a></li>
				<li><a href="graphs.jsp" title="">Interactive Data</a></li>
				<li><a href="aboutus.html" title="">About Us</a></li>
				<li><a href="contactus.html" title="">Contact Us</a></li>
			</ul>
		</div>
	</div>
</div>
<div id="banner-wrapper">
    <div id="banner" class="container">
     <iframe src="https://www.google.com/maps/d/embed?mid=ze_En61LEf6Q.kFJHxHS2Bwf4" width="640" height="480" align="center"></iframe>
    </div>
    <div>
        
        <%
            Query query = new Query(request);
        %>
        <form id="form-query">
            <%
                String division = request.getParameter("div_num");
            %>
            <font color = #3f3f3f><b>Division:</b></font>
            <input type="text" name="div_num" value="<%= division%>" id="div_num">

            <br>
            <font color = #3f3f3f><b>Program:</b></font>
            <select name="program_num" id="program_num">
              <option value="3114">Biotechnology Foundations</option>
              <option value="3101">Dental Assistant</option>
              <option value="3102">Emergency Medical Technology</option>
              <option value="3103">Health Career Cluster</option>
              <option value="3105">Home Health Aide</option>
              <option value="3106">Medical Assistant</option>
              <option value="3108">Nursing Aide</option>
              <option value="3115">Pharmacy Technician</option>
              <option value="3113">Physical Therapy</option>
              <option value="3109">Practical Nursing</option>
              <option value="3116">Sports Medicine</option>
              <option value="3111">Veterinary Assistant</option>
            </select>
            <br>
            
            <font color = #3f3f3f><b>Year:</b></font>
            <input name="sch_year" id="sch_year" type ="range" min ="2007" 
                   max="2014" step ="1" onchange="showValue(this.value)" />
                        <span id="range">
                            <script type="text/javascript">
                                <%out.print(query.getSchYear());%>
                            </script></span>
            <script type="text/javascript">
            function showValue(newValue)
            {
                  document.getElementById("range").innerHTML=newValue;
            }
            </script>
            <input type="submit">
        </form>



        <script>
            document.getElementById("div_num").value = "<%= query.div_num%>";
            document.getElementById("program_num").value = "<%= query.program_num%>";
            document.getElementById("sch_year").value = "<%= query.sch_year%>";
        </script>

        <script>
            google.charts.load('current', {'packages':['corechart', 'line']});
            google.charts.setOnLoadCallback(drawChart);
            function drawChart() {
                var data = google.visualization.arrayToDataTable([
                 ['Race', 'Number of Students Completing Program'],
                <%
                    int[][] race_pie = query.getRaceData();

                    for(int i = 0; i < 7; i++)
                    {
                        if (race_pie[i][0] == 0)
                            break;
                        out.print("[");
                        switch( race_pie[i][0] )
                        {
                            case 1:
                                out.print("'American Indian/Alaska Native'");
                                break;
                            case 2:
                                out.print("'Asian'");
                                break;
                            case 3:
                                out.print("'Black or African/American'");
                                break;
                            case 4:
                                out.print("'Hispanic of any race'");
                                break;
                            case 5:
                                out.print("'White'");
                                break;
                            case 6:
                                out.print("'Native Hawaiian/Other Pacific Islander'");
                                break;
                            case 99:
                                out.print("'Two or more races, non-Hispanic '");
                                break;
                        }
                        out.print(",");
                        out.print(race_pie[i][1]);
                        out.print("],");
                    }
                %>]);

                var options = {
                  title: 'Racial Make-Up of CTE Program',
                  is3D: true,

                  colors: ['#9900ff', '#ad33ff', '#c266ff', '#d699ff',
                                '#e0b3ff', '#ebccff', '#f5e6ff'],
                  backgroundColor: '#CBB677'
                };

                var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
                chart.draw(data, options);
            }
        </script>
        <script>
            google.charts.setOnLoadCallback(drawLineStyles);
            
            function drawLineStyles() {
                var data = new google.visualization.DataTable();
                data.addColumn('number', 'X');
                data.addColumn('number', 'degrees awarded');
                data.addColumn('number', 'STEMH degrees');
                data.addRows([
            <%
                ArrayList table = query.getData();

                int table_count = 0;
                while (table.size() > table_count && table_count < 15) {
                    out.println("\n[" + (int) (2000 + table_count) + ",");
                    out.println(table.get(table_count) + ",");
                    out.println(table.get(table_count + 15));
                    out.print("],");
                    table_count++;
                }
                out.print("\n]);");
            %>

            var options = {
            hAxis: {
            title: 'Year',
                    format: '',
                    gridlines: { color: '#FFF', count: 15 }
            },
            vAxis: {
                    title: 'Number of Degrees'
                    },
            };
            var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
            chart.draw(data, options);
            }
        </script>

        <div id="chart_div"></div>
        <div id="piechart_3d" style="width: 900px; height: 900px; align: center;"></div>
    </div>
</div>
<div id="copyright" class="container">
	<p>&copy; Health4VA | JMU | Spring 2016 | CS 474 </p>
</div>
</body>
</html>