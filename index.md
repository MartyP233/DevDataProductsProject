---
title       : Introducing my Shiny App!
subtitle    : This app is the bap
author      : MartyP
job         : Coursee
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [shiny]    # {mathjax, quiz, bootstrap}
mode        : standalone # {standalone, draft}
knit        : slidify::knit2slides
---

## The App - Exploring government staffing data

Government data is often hard to get into, mostly because entities do large scale data releases and it takes time to get your head around what all that data is. 

This app is designed to segment up a large dataset, making it more digestable by:

1. Splitting it into several datasets
2. Allowing you to view only the variables you select
3. Letting you search for the particular rows you want to view

<div style="text-align: center;"> <img src="http://pas-wordpress-media.s3.amazonaws.com/content/uploads/2014/10/bigandsmall-e1412899046917.jpg" height="200px" width="300px" /></div>
 

--- .class #id 


## How to use it

This app will help you to carry out EDA. You have a lot of data and want to find something - either a number, trend, or a comparison. You are initially overwhemled. You've got some options for helping you get from big to small. 

- Who am I interested in? 1 department? The group as a whole? (Public Service) A typical EDA could go as follows:


```
## <div class="row-fluid">
##   <div class="col-sm-4">
##     <form class="well">
##       <div class="form-group shiny-input-container">
##         <label class="control-label" for="Department">Choose Department</label>
##         <div>
##           <select id="Department"><option value="Ministry of Agriculture &amp; Forestry" selected>Ministry of Agriculture &amp; Forestry</option>
## <option value="Archives New Zealand">Archives New Zealand</option>
## <option value="Office of the Auditor-General">Office of the Auditor-General</option>
## <option value="Department of Building &amp; Housing">Department of Building &amp; Housing</option>
## <option value="Canterbury Earthquake Recovery Authority">Canterbury Earthquake Recovery Authority</option>
## <option value="Chief Executives">Chief Executives</option>
## <option value="Child, Youth &amp; Family Services">Child, Youth &amp; Family Services</option>
## <option value="Department of Conservation">Department of Conservation</option>
## <option value="Department of Corrections">Department of Corrections</option>
## <option value="Department for Courts">Department for Courts</option>
## <option value="Crown Law Office">Crown Law Office</option>
## <option value="Ministry for Culture &amp; Heritage">Ministry for Culture &amp; Heritage</option>
## <option value="NZ Customs Service">NZ Customs Service</option>
## <option value="Ministry of Defence">Ministry of Defence</option>
## <option value="Ministry of Economic Development">Ministry of Economic Development</option>
## <option value="Ministry of Education">Ministry of Education</option>
## <option value="Education Review Office">Education Review Office</option>
## <option value="Ministry for the Environment">Ministry for the Environment</option>
## <option value="Ministry of Fisheries">Ministry of Fisheries</option>
## <option value="Ministry of Foreign Affairs &amp; Trade">Ministry of Foreign Affairs &amp; Trade</option>
## <option value="Government Communications Security Bureau">Government Communications Security Bureau</option>
## <option value="Ministry of Health">Ministry of Health</option>
## <option value="Inland Revenue Department">Inland Revenue Department</option>
## <option value="Department of Internal Affairs">Department of Internal Affairs</option>
## <option value="Ministry of Justice">Ministry of Justice</option>
## <option value="Department of Labour">Department of Labour</option>
## <option value="Land Information New Zealand">Land Information New Zealand</option>
## <option value="Ministry of M?ori Development">Ministry of M?ori Development</option>
## <option value="Ministry of Business, Innovation and Employment">Ministry of Business, Innovation and Employment</option>
## <option value="National Library of New Zealand">National Library of New Zealand</option>
## <option value="New Zealand Food Safety Authority">New Zealand Food Safety Authority</option>
## <option value="Ministry of Pacific Island Affairs">Ministry of Pacific Island Affairs</option>
## <option value="Ministry for Primary Industries">Ministry for Primary Industries</option>
## <option value="Department of the Prime Minister &amp; Cabinet">Department of the Prime Minister &amp; Cabinet</option>
## <option value="Public Service">Public Service</option>
## <option value="Public Trust Office">Public Trust Office</option>
## <option value="Ministry of Research, Science &amp; Technology">Ministry of Research, Science &amp; Technology</option>
## <option value="Ministry of Science and Innovation">Ministry of Science and Innovation</option>
## <option value="Serious Fraud Office">Serious Fraud Office</option>
## <option value="Ministry of Social Development">Ministry of Social Development</option>
## <option value="Ministry of Social Policy">Ministry of Social Policy</option>
## <option value="State Services Commission">State Services Commission</option>
## <option value="Statistics New Zealand">Statistics New Zealand</option>
## <option value="Ministry of Transport">Ministry of Transport</option>
## <option value="The Treasury">The Treasury</option>
## <option value="Ministry of Women's Affairs">Ministry of Women's Affairs</option>
## <option value="Department of Work &amp; Income">Department of Work &amp; Income</option>
## <option value="Ministry of Youth Affairs">Ministry of Youth Affairs</option></select>
##           <script type="application/json" data-for="Department" data-nonempty="">{}</script>
##         </div>
##       </div>
##     </form>
##   </div>
## </div>
```
- What do I want to know about that group? Staff number, Ethnic information, or other random stats? Explore to get familiar


```
## <div class="row-fluid">
##   <div class="col-sm-4">
##     <form class="well">
##       <div class="form-group shiny-input-container">
##         <label class="control-label" for="Type">Choose Type of Stats</label>
##         <div>
##           <select id="Type"><option value="Staff Number" selected>Staff Number</option>
## <option value="Ethnic Stats">Ethnic Stats</option>
## <option value="Other Stats">Other Stats</option></select>
##           <script type="application/json" data-for="Type" data-nonempty="">{}</script>
##         </div>
##       </div>
##     </form>
##   </div>
## </div>
```
- More specifically, what metric/s am I interested in?


```
## <div class="row-fluid">
##   <div class="col-sm-4">
##     <form class="well">
##       <div class="form-group shiny-input-container">
##         <label class="control-label" for="Metric">Choose Metric</label>
##         <div>
##           <select id="Metric"><option value="Department" selected>Department</option>
## <option value="Year">Year</option>
## <option value="FTEs">FTEs</option>
## <option value="Headcount">Headcount</option>
## <option value="Average.Age">Average.Age</option>
## <option value="Tenure">Tenure</option>
## <option value="Average.sick.and.domestic.leave.taken.per.employee..days.">Average.sick.and.domestic.leave.taken.per.employee..days.</option>
## <option value="Average.leave.balance..days.">Average.leave.balance..days.</option>
## <option value="Percentage.of.staff.with.a.leave.balance.of.over.5.weeks">Percentage.of.staff.with.a.leave.balance.of.over.5.weeks</option>
## <option value="Gross.Turnover">Gross.Turnover</option>
## <option value="Unplanned.Turnover">Unplanned.Turnover</option>
## <option value="Unplanned.turnover.of.staff.with.less.than.2.years.tenure">Unplanned.turnover.of.staff.with.less.than.2.years.tenure</option>
## <option value="Number.of.fixed.term.staff">Number.of.fixed.term.staff</option>
## <option value="Percentage.of.fixed.term.staff">Percentage.of.fixed.term.staff</option>
## <option value="Number.of.Managers">Number.of.Managers</option>
## <option value="Percentage.of.Managers">Percentage.of.Managers</option>
## <option value="Number.of.Women">Number.of.Women</option>
## <option value="Percentage.of.Women">Percentage.of.Women</option>
## <option value="Number.of.Maori.staff">Number.of.Maori.staff</option>
## <option value="Percentage.of.Maori.staff">Percentage.of.Maori.staff</option>
## <option value="Number.of.Asian.staff">Number.of.Asian.staff</option>
## <option value="Percentage.of.Asian.staff">Percentage.of.Asian.staff</option>
## <option value="Number.of.Pacific.staff">Number.of.Pacific.staff</option>
## <option value="Percentage.of.Pacific.staff">Percentage.of.Pacific.staff</option></select>
##           <script type="application/json" data-for="Metric" data-nonempty="">{}</script>
##         </div>
##       </div>
##     </form>
##   </div>
## </div>
```


---

## So what's the point?

After you have made your selections, you should have narrowed down the dataset to a page worth of data - something a lot more manageable for analysis!

<div style="text-align: center;"> <img src="https://cdn3.vox-cdn.com/thumbor/ST3W8A3Kum8HlwddNHoF07WWrhk=/0x0:1920x1080/1600x900/cdn0.vox-cdn.com/uploads/chorus_image/image/46147742/cute-success-kid-1920x1080.0.0.jpg" height="450px" /></div>

---

## Where it could go

I have built this app specifically for one dataset - it could be built to take any dataset. i.e. make the code generalised to work whatever data you put in. 

An option to download the reduced dataset would also be useful.

Add a visualistion component such as a google motion chart, rCharts or any interactive R visualistion. 

<h3>Useful Links</h3>

- [link to github](https://github.com/MartyP233/DevDataProductsProject)
- [link to app](https://martyp233.shinyapps.io/ShinyApp-1)
- [link to more info on dataset](http://www.ssc.govt.nz/workforce-stats)
