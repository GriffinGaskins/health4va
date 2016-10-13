<%@page import="java.util.*, db.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>SOL Test Scores</title>
        <link href="hw4-sol.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    </head>
    <body>
        <h1>Query</h1>
        <%
           Query query = new Query(request);
        %>
        <script>
            document.getElementById("program_num").value = "3101";
            document.getElementById("sch_year").value = "2012";
        </script>
        <form method="get">
            
            Program:
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
            
            Year:
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
            <input type="submit" value="Submit">     
        </form>

        <div id="piechart_3d" style="width: 900px; height: 500px;"></div>
        <script> 
         google.charts.load('current', {'packages':['corechart']});
         google.charts.setOnLoadCallback(drawChart);
         function drawChart() {
             var data = google.visualization.arrayToDataTable([
              ['Race', 'Number of Students Completing Program'],
             <% 
                 int[][] race_pie = query.getData();

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
               title: 'Race',
               is3D: true,
               colors: ['#9900ff', '#ad33ff', '#c266ff', '#d699ff', 
                             '#e0b3ff', '#ebccff', '#f5e6ff']
             };

             var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
             chart.draw(data, options);
         }
     </script>

     <script>
         document.getElementById("program_num").value = "<%= query.program_num %>";
         document.getElementById("sch_year").value = "<%= query.sch_year %>";
     </script>
    </body>
</html>
