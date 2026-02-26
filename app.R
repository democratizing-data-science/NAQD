# install.packages("shinythemes")
library(shinythemes)
library(shiny)
library(DT)
library("shinycssloaders")
options(spinner.color="#CD1076", spinner.type = 1, shiny.maxRequestSize=30*1024^2)
ui <- fluidPage(theme = shinytheme("cyborg"),
tags$head(tags$style(HTML("a {color: #CD1076; font-weight: bold}"))),
    navbarPage("NAQD [Network Analysis of Qualitative Data]",#; color:orangered
				tabPanel("I. Upload Data",
				 sidebarPanel(
				 selectInput("select", h4("A. Load your data or select an example", style ="font-weight:bold"),
                       choices = list("Your data will be displayed after loading is completed"=2, "Interview or multiple focus groups example" = 1), selected = 2),

tags$style(".btn-file {background-color:#CD1076; border-color: #2e6da4; } .btn:hover {
color: #ffffff;
background-color: #CD1076;
border-color: #2e6da4;
}
.progress-bar {background-color: #CD1076; }",
"
                    .dataTables_wrapper .dataTables_length, .dataTables_wrapper .dataTables_filter, .dataTables_wrapper .dataTables_info, .dataTables_wrapper .dataTables_processing, .dataTables_wrapper .dataTables_paginate {
                    color: #ffffff;
                    }

                    thead {
                    color: #ffffff;
                    }

                    select {
                    color: #CD1076;
                    }

                    input {
                    color: #CD1076;
                    }

                     tbody {
                    color: #000000;
                    }

                   "),
tags$style(HTML("b, strong{color:#CD1076;
} a:hover{color:#2e6da4;}
		")),
												h4("C. Required: Select column names from your csv file", style ="font-weight:bold"), #; color:black
												selectInput('ego', 'Actor column (i.e., code provider or document ID)', ""),
												selectInput('alter', 'Code column (i.e., code provided or text passage or excerpt)', ""),
												h4("D. Optional: If no role, color, or shape are needed don't modify", style ="font-weight:bold"),#; color:black
												selectInput('role', 'Column denoting *role* based on actor (or sender) column', ""),
												selectInput('woman', '*Color* based on community assignment (recommended) or column selected', ""),
												selectInput('shape', 'Column for *shape* based on non-personal attributes column (recommended)', ""),
												# selectInput('quotes', 'Column for *code* content or information description', ""),
							tags$style(HTML(".js-irs-0 .irs-single, .js-irs-0 .irs-bar-edge, .js-irs-0 .irs-bar {background: #CD1076}")),
							tags$style(HTML(".js-irs-1 .irs-single, .js-irs-1 .irs-bar-edge, .js-irs-1 .irs-bar {background: #CD1076}")),
												sliderInput("obs", "No. of groups for role variable (default 25):", min = 1, max = 50, value = 25),
												sliderInput("trans", "Color transparency (1 is solid):", min = 0, max = 1, value = .8),
												h5("If ready, go to step III above to execute", style ="font-weight:bold")
												),
												mainPanel(
												h3("NAQD handles numeric and alphanumeric inputs", style ="font-weight:bold"),
												h4("B. Upload your data here or load example(s) as indicated in step A", style ="font-weight:bold"),#; color:black"

												uiOutput("toy_data"),#PHUDCFILY
							h4("MINIMAL information required:", style ="font-weight:bold"), #; color:black
    htmlOutput("mintext"),
	h4("OPTIONAL information based on actors' attributes or documents' characteristics. These pieces are used to *contextualize* the relationships and the content of codes", style ="font-weight:bold"),
	htmlOutput("opttext"),
	DT::dataTableOutput("table")#, DT::dataTableOutput("tables") Changed it to only there
												),
                                              ),

				tabPanel("II. Optional adjustments",
                                          fluidRow(
    column(6,
     h3("Default colors will work, change as desired", style ="font-weight:bold"),#; color:black
                                             h4("Up to 10 colors based on actor attributes plus 1 color for codes", style ="font-weight:bold"),#; color:black
     # tags$p(a("Click to see full color palette",target="_blank",href="https://drive.google.com/file/d/0B5MwXYfrtW9JWnRzcEs2anpLd3c/view?usp=sharing" )),
	tags$p(a("Click to see full color palette",target="_blank",href="RColorChart.pdf" )),
												textInput("color_nodes", "Code color (def orangered)", "orangered"),
												textInput("color_actatt1", "Actor color 1st attribute (def violetred3)", "violetred3"),
												textInput("color_actatt2", "Actor color 2nd attribute (def mediumblue)", "mediumblue"),
												textInput("color_actatt3", "Actor color 3rd attribute (def mediumblue)", "red"),
												textInput("color_actatt4", "Actor color 4th attribute (def mediumblue)", "yellow"),
												textInput("color_actatt5", "Actor color 5th attribute (def mediumblue)", "green"),
												textInput("color_actatt6", "Actor color 6th attribute (def mediumblue)", "black"),
												textInput("color_actatt7", "Actor color 7th attribute (def mediumblue)", "grey"),
												textInput("color_actatt8", "Actor color 8th attribute (def mediumblue)", "cyan"),
												textInput("color_actatt9", "Actor color 9th attribute (def mediumblue)", "gold"),
												textInput("color_actatt10", "Actor color 10th attribute (def mediumblue)", "gold4"),
												),
      column(6,
      h3("Default colors will work, change as desired", style ="font-weight:bold"),#; color:black
                                             h4("Up to 10 shapes based on actor attributes plus 1 shape for codes (ex. 200=circle, 3=triangle)", style ="font-weight:bold"),#; color:black
												numericInput("shape_nodes", "Code shape (default 200)", 200),
												numericInput("shape_actatt1", "Actor shape 1st attribute (def 3)", 3),
												numericInput("shape_actatt2", "Actor shape 2nd attribute (def 4)", 4),
												numericInput("shape_actatt3", "Actor shape 3rd attribute (def 5)", 5),
												numericInput("shape_actatt4", "Actor shape 4th attribute (def 6)", 6),
												numericInput("shape_actatt5", "Actor shape 5th attribute (def 7)", 7),
												numericInput("shape_actatt6", "Actor shape 6th attribute (def 8)", 8),
												numericInput("shape_actatt7", "Actor shape 7th attribute (def 9)", 9),
												numericInput("shape_actatt8", "Actor shape 8th attribute (def 10)", 10),
												numericInput("shape_actatt9", "Actor shape 9th attribute (def 12)", 12),
												numericInput("shape_actatt10","Actor shape 10th attribute (def 15)", 15),
    ),
    ),
	),
tabPanel(p(icon("project-diagram"), "   III. Execute NAQD   ", style ="font-weight:bold; background-color: #CD1076; font-size: 18px"), # ; color:black p("active tab is in gold" , style ="font-weight:bold")
             # h3("RQDA produces three main outcomes", style ="font-weight:bold"),
			# h4("1. Table with results of community allocation by actors' attributes selected in section B", style ="font-weight:bold"),
			 # h4("2. If role attribute was added, a PDF with all QAP comparisons included this indicator", style ="font-weight:bold"),
			 # h4("3. Aggregated interactive network depiction as shown below. If role was selected, network depictions are also generated", style ="font-weight:bold"),
			 htmlOutput("opttextphu", style = "font-size: 20px"), uiOutput("downloadData"), dataTableOutput("tables"), withSpinner(uiOutput('mymap'))),
		tabPanel(p("IV. About NAQD", style ="font-weight:bold"), # ; color:black p("active tab is in gold" , style ="font-weight:bold")
		tags$h2("Program Description"),
				tags$h3(HTML("Despite the widespread availability of artificial intelligence <b>(AI)</b>, machine learning <b>(ML)</b>, and data science and visualization <b>(DSV)</b> tools, up until now <b>access</b> to the benefits of these analytic tools has been <b>conditioned</b> to computer programming and software coding proficiency. Indirectly then, these benefits are currently <b>overconcentrated in a single demographic</b>. <br><br>

		<b>Democratizing Data Science (DDS)</b>, a new data analytics movement, frees these benefits by lifting computer programing restrictions and offering <b>open software</b> access to rigorous, state-of-the-art analytic tools for mixed method research. <br><br>

		<b>DDS</b> then, seeks to <b>expand access</b> to the <b>analytic and knowledge-based</b> benefits of <b>AI, ML,</b> and <b>DSV</b> with <b>zero</b> coding requirements.<br> <br>

		<b>NAQD</b> constitutes the first product released as part of the mission of <b>DDS</b>.")),###PHUDCFILY <br><br>

###PHUDCFILYHowever, as part of this movement, <b>technical</b> support to <b>help expand and strengthen</b> these software tools is also <b>encouraged</b>. Access to <b>source code</b> and documentation is provided and <b>collaboration</b> opportunities are <b>welcomed</b>.")),
		tags$hr(),
		# # # PHUDCFILYtags$h2("Questions and ideas for software applications?"),

		# # # tags$h3("Reach me (Manuel S. Gonzalez Canche) at ",a("msgc@upenn.edu", href="mailto:msgc@upenn.edu"), "and", a("@manu_canche, Twitter", href="https://twitter.com/manu_canche", target="_blank")),
		# # # tags$h3("More info at", a("Democratizing Data Science, GitHub", href="https://github.com/democratizing-data-science", target="_blank"), "and quick updates", a("@DataScienceOpen, Twitter", href="https://twitter.com/DataScienceOpen", target="_blank")),

		img(src = "DDS_white_phudcfily.png", style = "float: left; width: 800px; margin-right: 5px; margin-top: 1px")
                        )
)
)

server = function(input, output, session){
library(DT)#PHUDCFILY
library(gtools)
ex1<- as.data.frame(sapply(read.csv("www/Anonymized_JMMR_NAQD.csv"),function(x)gsub("/", "_",x))) #PHUDCFILY
# ex1<- as.data.frame(sapply(read.csv("https://raw.githubusercontent.com/msgc/movie/master/Anonymized_JMMR_NAQD.csv"),function(x)gsub("/", "_",x))) #PHUDCFILY
# ex2<- read.csv("https://raw.githubusercontent.com/msgc/movie/master/essay_document_analysis_PHUDCFILY.csv") #PHUDCFILY


# PHUDCFILY
output$toy_data <- renderUI({
if (input$select==1) {
               actionButton(inputId = "first", label = "Click to load interview data example shown below", icon("paper-plane"),
    style="color: #fff; background-color: #CD1076; border-color: #2e6da4")#PHUDCFILY
} else {
fileInput("file1", label=NULL,
													buttonLabel = "Click to browse for your CSV file or simply drag it here with your mouse",
									                placeholder = NULL,
                                                            multiple = FALSE,
                                                            accept = c("text/csv",
                                                                       "text/comma-separated-values,text/plain",
                                                                       ".csv"))
}
  })

a1 <- reactiveValues(a = NULL)
observeEvent(input$file1, {
     a1$a <- as.data.frame(sapply(read.csv(input$file1$datapath),function(x)gsub("/", "_",x)))#PHUDCFILY
    })
observeEvent(input$first, {
     a1$a <- ex1[,1:ncol(ex1)]
    })

#PHUDCFILY
output$mintext <- renderText({
if (input$select==1) {

               paste("Columns", "<b>'actor_ID'</b>", "and", "<b>'code_ID'</b>", "represent humans (or documents)", "(<b>'actor_ID'</b>)", "providing codes", "(<b>'code_ID'</b>)")



} else { #MODIFY PHUDCFILY
               paste("Your data should have <b>at least</b> two columns", "<b>actors' or documents' IDs</b>", "and", "<b>codes</b> provided by or retrieved from them.", "<br><b>See data format example</b> under section A.")

}
})

output$opttext <- renderText({
if (input$select==1) {
               paste("In *this example* <b>'ID'</b>", "is the actor or document that was qualitatively coded,<br>
			   <b>'Code'</b> is the classified text,<br>
			   <b>'Text'</b> is the content of each code.<br>
			   <b>'Role'</b>", "captures actors' role in the study (i.e., student, administrator, faculty, faculty-administrator).<br>
			   <b>'Gender'</b>", "is a personal attribute as reported by participants.<br>
			   Option <b>'No. of groups for role variable'</b>", "in section D is the upper limit for the optimal number of communities. By default is selected 25 but can be increased or reduced based on network complexity.<br>
			   Option <b>'Color transparency'</b>", "ranges from solid (1) to transparent (0) in the network visualizations.")

} else { #MODIFY PHUDCFILY
               paste(
			   "To use RQDA researchers need to upload a database with <b>'ID'</b> and <b>'Code'</b> as depicted in the example provided.<br>
			   <b>Section D</b> may be populated with <b>'role'</b>", "that indicates participants' function (e.g., student, administrator, faculty) and, <b>when selected</b> will automatically conduct <b>QAPs</b> and produce disaggregated interactive network visualizations by <b>role category</b>.<br>
			   Option <b>'color'</b>", "by default is assigned based on community detected using spin-glass modeling. However, researchers may select other options, such as gender, for example.<br>
			   Option <b>'shape'</b>", "may be used to add other non-personal attributes of authors or documents' characteristics. <b>Retrieved by clicking on actors or documents</b> in the HTML visualizations.<br>
			   Option <b>'No. of groups for role variable'</b>", "is the upper limit for the optimal number of communities. By default is selected 25 but can be increased or reduced based on network complexity.<br>
			   Option <b>'Color transparency'</b>", "ranges from solid (1) to transparent (0) in the network visualizations.")
}
})

output$table <- DT::renderDataTable({
if (input$select==1) {
datatable(ex1, options = list(
    pageLength = 5))
} else {
datatable(a1$a, options = list(
    pageLength = 6))
}
})
#PHUDCFILY

outVar0 = reactive({
      mydata = a1$a
      names(mydata)#c("select an option below (e.g., 'actor_ID' or 'sender' depending on your data & method)",
    })
    observe({
      updateSelectInput(session, "ego",
      choices = outVar0()
    )})

outVar1 = reactive({
      mydata = a1$a
      c(names(mydata)[2],names(mydata))#c("select an option below (e.g., 'code_ID' or 'receiver' depending on your data & method)",
    })
    observe({
      updateSelectInput(session, "alter",
      choices = outVar1()
    )})

outVar2 = reactive({
      mydata = a1$a
      c("no_role_added",names(mydata))
    })

    observe({
      updateSelectInput(session, "role",
      choices = outVar2()
    )})

outVar3 = reactive({
      mydata = a1$a
      c("community", names(mydata))
    })

    observe({
      updateSelectInput(session, "woman",
      choices = outVar3()
    )})

outVar4 = reactive({
      mydata = a1$a
      c("no_shape_added",names(mydata))
    })

    observe({
      updateSelectInput(session, "shape",
      choices = outVar4()
    )})

# outVar5 = reactive({
      # mydata = a1$a
      # c("no_quote_added",names(mydata))
    # })

    # observe({
      # updateSelectInput(session, "quotes",
      # choices = outVar5()
    # )})

output$opttextphu <- renderText({
if (is.data.frame(a1$a)==TRUE) {
               paste("<b>NAQD</b>", "was programmed to produce four main outcomes:<br>
			   <b>1.</b> A downloadable table with results of <b>community allocation</b> by actors' attributes selected in <b>tab I, section B</b>.<br>
			   <b>2. If a role attribute was added</b>, a PDF with all <b>QAP</b> comparisons accounted for by this indicator <br>
			   <b>3. An aggregated</b> interactive network depiction of actors and codes as shown below the table in this page and, <br>
			   <b>4.</b> If role was selected, <b>a disagregated set of interactive</b> network depictions of actors and their codes.")
} else { #MODIFY PHUDCFILY
               paste(
			   "<b>To start, upload a dataset</b> in *.csv format with at least Actor and Code columns as depicted in section I.</b><br><br>
			   After uploading the dataset and selecting actor and code columns (plus role and attributes), <b>NAQD</b> will produce <b>four main outcomes</b>: <br>
			   <b>1.</b> A downloadable table with results of <b>community allocation</b> by actors' attributes selected in <b>tab I, section B</b>.<br>
			   <b>2. If a role attribute was added</b>, a PDF with all <b>QAP</b> comparisons accounted for by this indicator <br>
			   <b>3. An aggregated</b> interactive network depiction of actors and codes as shown below the table in this page and, <br>
			   <b>4.</b> If role was selected, <b>a disaggregated set of interactive</b> network depictions of actors and their codes.")

}
})

###PHUDCFILY
output$downloadData <- renderUI({
    req(input$select, is.data.frame(a1$a)==TRUE)
    downloadButton("downloadData01", "Download full database")
  })

# downloadHandler() takes two arguments, both functions.
# The content function is passed a filename as an argument, and
#   it should write out data to that filename.
output$downloadData01 <- downloadHandler(

# This function returns a string which tells the client
# browser what name to use when saving the file.
filename = function() {
    paste("Fully_classified_dataset", "csv", sep = ".")
},

# This function should write data to a file given to it by
# the argument 'file'.
content = function(file) {
    #  sep <- switch(input$filetype, "csv" = ",", "tsv" = "\t")

    # Write to a file specified by the 'file' argument 
    write.table(a1$dfphu, file, sep = ",",
    row.names = FALSE)
}
)

###PHUDCFILY

    output$mymap <- renderUI({
	if (is.data.frame(a1$a)==TRUE) {
		a <- a1$a
		# phu=input$woman
		colnames(a)[colnames(a) == input$ego] <- "ID"
		colnames(a)[colnames(a) == input$alter] <- "codename"
		# colnames(a)[colnames(a) == input$role] <- "role"
		# a<-a[a$codename!="Quotes"&a$codename!="Key Quote",]
		a$community<-as.factor("no_color_selected")
		a$no_shape_added<-as.factor("no_shape_selected")
		a$no_role_added<-as.factor("no_role_selected")
		a$no_quote_added<-as.factor("no_quote_selected")

		am<-a
		colnames(am)[colnames(am) == input$woman] <- "genderx"
		colnames(am)[colnames(am) == input$shape] <- "border"
		colnames(am)[colnames(am) == input$role] <- "rolex"
		# am$rolexn <- gsub("/", "_", am$rolex)
		# am$rolex <- ifelse(am$rolex=="no_role_selected", am$rolex, am$rolexn)
	am$rolecrit<-length(levels(as.factor(am$rolex)))>=10&is.numeric(am$rolex)
	am$catrole <- ifelse(am$rolecrit==TRUE, as.character(quantcut(am$rolex, input$obs)), "no_role_provided")
am$rolex <- ifelse(am$rolecrit==TRUE, as.character(am$catrole), as.character(am$rolex))
		# colnames(am)[colnames(am) == input$quotes] <- "quotes"
		dim(a)
        str(a)
        head(am)
        nrow(a)
		a$ID<-as.character(a$ID)
        a$ID<-as.factor(a$ID)
        a$codename<-as.character(a$codename)
        a$codename<-as.factor(a$codename)
   am$ID<-as.character(am$ID)
   am$ID<-as.factor(am$ID)
   am$codename<-as.character(am$codename)
   am$codename<-as.factor(am$codename)

        table(unique(as.numeric(a$codename)))
        table(unique(as.numeric(a$ID)))

        a2<-a[!duplicated(a$codename),]
        a2
        dim(a2)
        a2$cid<-as.numeric(a2$codename)+max(unique(as.numeric(a$ID)))

        a<-a[,c("ID", "codename")]
library(igraph)
# Converting the data to an igraph object:
net <- graph.data.frame(cbind(as.numeric(a$ID), (as.numeric(a$codename)+max(unique(as.numeric(a$ID))))), directed=T)
V(net)$type <- V(net)$name %in% as.numeric(a$ID)
i<-table(V(net)$type)[2]


E(net)$weight <- 1
g.c <- simplify(net)
E(g.c)$weight

if (is_connected(g.c)==TRUE) {
cd <- cluster_spinglass(g.c, spins=input$obs)
} else {
cd <- clusters(g.c)
cd$names <- names(cd$membership)
}



#cd <- cluster_spinglass(g.c, spins=input$obs)
dfphu<-data.frame(name=cd$names[1:i], names = as.character(am$ID[!duplicated(am$ID)][match(as.numeric(am$ID)[!duplicated(am$ID)], cd$names[1:i])]), community=cd$membership[1:i], role=am$rolex[!duplicated(am$ID)][match(as.numeric(am$ID)[!duplicated(am$ID)], cd$names[1:i])],
color=am$genderx[!duplicated(am$ID)][match(as.numeric(am$ID)[!duplicated(am$ID)], cd$names[1:i])],
shape=am$border[!duplicated(am$ID)][match(as.numeric(am$ID)[!duplicated(am$ID)], cd$names[1:i])])

# write.csv(dfphu, paste(getwd(),"tdsfphu.csv", sep=""))

dfphu$color <- ifelse(dfphu$color=="no_color_selected", "color-based_on_community_assigned", dfphu$color)
a1$dfphu<-dfphu
am$communityx <- dfphu$community[match(as.numeric(am$ID),dfphu$name)] #as.factor("community_assigned")
am$genderx <- ifelse(am$genderx=="no_color_selected", am$communityx, as.character(am$genderx)) #this should work PHUDCFILY


###Centrality measures
cent1<-data.frame(totaldegree=degree(net, mode="total"),
indegree=degree(net, mode="in"), outegree=degree(net, mode="out"),
bet=round(betweenness(net, directed=F, normalized = TRUE, weights=NA),3),
eig=round(evcent(net, weights=NA)$vector,3),
closeness=round((1/closeness(net))/max(1/closeness(net)), 3))
cent1#this prints the table

cent1$eig[1:i]<-round(cent1$eig[1:i]/max(cent1$eig[1:i]),2)
cent1$eig[(i+1):nrow(cent1)]<-round(cent1$eig[(i+1):nrow(cent1)]/max(cent1$eig[(i+1):nrow(cent1)]),2)
cent1$bet[1:i]<-round(cent1$bet[1:i]/max(cent1$bet[1:i]),2)
cent1$bet[(i+1):nrow(cent1)]<-round(cent1$bet[(i+1):nrow(cent1)]/max(cent1$bet[(i+1):nrow(cent1)]),2)
set.seed(47)
# lc <- cluster_infomap(net)

# cent1$com<-membership(lc)
cent1$id<-rownames(cent1)
cent1$id<-as.numeric(cent1$id)

netn <- graph.data.frame(am[,c("ID", "codename")], directed=T)
cent1$nombre <- V(netn)$name
write.csv(cent1, "centrality_db.csv", row.names=FALSE)

detach(package:igraph)

library(ndtv)
library(networkDynamic) # load the dynamic extensions
library(dplyr)
library(scales)

        a$k<-paste(a$ID, a$codename, sep="")
        a1<-data.frame(table(a$k))
        head(a1)
        a$f<-a1$Freq[match(a$k,a1$Var1,)]
        # a$n<-1:nrow(a)
        head(a)

        a1<-data.frame(table(a$ID))
        head(a1)
        a$fid<-a1$Freq[match(a$ID,a1$Var1,)]

        a<-a[order(a$ID),]
		am<-am[order(am$ID),]
        head(am)

        a$filename<-as.numeric((a$ID))
        am$filename<-as.numeric((am$ID))

        a$on<-(ave(a$filename, a$filename, FUN=seq_along))#-1
        a$term<-(max(a$fid)+1)
        a$cid<-a2$cid[match(a$codename,a2$codename)]
		am$cid<-a2$cid[match(am$codename,a2$codename)]
        head(a)
        str(a)

        vd<-data.frame(id=c(unique(a$filename), unique(a$cid)),onset=rep(0,length(c(unique(a$filename), unique(a$cid)))),term=rep((max(a$fid)+1)))
         head(vd)

         vd$vertex_id<-as.character(a$codename[match(vd$id,a$cid)])
         # vd$vertex_id<-a$filename[match(vd$id,a$filename)]
         vd[is.na(vd$vertex_id),]$vertex_id<-vd[is.na(vd$vertex_id),]$id
         vd
         #PHUDCFILY
         a$lead<-lead(a$on, 1)
         a3<-a[!duplicated(a$filename),c("fid","filename")]
         head(a3)
         a3$last<-a3$fid+1
         a$lead[cumsum(a3$fid)]<-a3$last
         a$lead2<-a$on+2#input$obs#coming from user input PHUDCFILY
         # fix(a)

         classDyn <- networkDynamic(vertex.spells=vd[,c("onset", "term", "id")], edge.spells=a[,c("on", "lead2", "filename","cid")])

         a2<-data.frame(c(table(a$filename),table(a$codename)))
         a2$id<-rownames(a2)
         a2
         names(a2)[1]<-"f"

         vd
         vd$f<-a2$f[match(vd$vertex_id,a2$id)]
         classDyn %v% "f" <- vd$f[match(classDyn %v% "vertex.names", vd$id)]

         b<-as.data.frame(classDyn)
         head(b)

		 b1<-b[!duplicated(b$edge.id),]
		 b1$e.id <- paste(b1$tail,b1$head, sep="")
		 # head(b1)

		 a$k2<-paste(a$filename, a$cid,sep="")
		 am$k2<-paste(am$filename, am$cid,sep="")
		 a$edge.id<-b1$edge.id[match(a$k2, b1$e.id)]
		 am$edge.id<-b1$edge.id[match(am$k2, b1$e.id)]
		 a$freq_edge<-round(a$f/a$fid,3)*100
		 # a$quotes<-as.character(am$quotes)

         classDyn <- networkDynamic(vertex.spells=vd[,c("onset", "term", "id")], edge.spells=a[,c("on", "lead2", "filename","cid", "f", "freq_edge")], create.TEAs = TRUE, edge.TEA.names=c("weight", "pct_weight"))
head(a)
         classDyn %e% "e.id"<- as.numeric(paste(b1$tail,b1$head, sep=""))
		 classDyn %v% "f" <- cent1$totaldegree[match(classDyn %v% "vertex.names", cent1$id)]

         am$fid<-as.numeric(as.factor(as.character(am$ID)))
         am$bordern<-as.numeric(as.factor(am$border))
         am$gendern<-as.numeric(as.factor(am$genderx))
         am$rolen<-as.numeric(as.factor(am$rolex))
		 am$border <-as.factor(am$border)
		 am$genderx <-as.factor(am$genderx) #gender
		 am$rolex <-as.factor(am$rolex)

         classDyn %v% "border" <- am$bordern[match(classDyn %v% "vertex.names", am$fid)]
         classDyn %v% "female" <- am$gendern[match(classDyn %v% "vertex.names", am$fid)]

		 classDyn %v% "power" <- cent1$eig[match(classDyn %v% "vertex.names", cent1$id)]#no missing PHUDCFILY
		 classDyn %v% "bet" <- cent1$bet[match(classDyn %v% "vertex.names", cent1$id)]#no missing PHUDCFILY
         classDyn %v% "role" <- as.character(am$rolex[match(classDyn %v% "vertex.names", am$fid)])
		 classDyn %v% "role" <- ifelse(!is.na(classDyn %v% "role"), classDyn %v% "role","code")


         classDyn %v% "com" <- ifelse(is.na(classDyn %v% "female"), input$color_nodes, ifelse(classDyn %v% "female" == 1, input$color_actatt1, ifelse(classDyn %v% "female" == 2, input$color_actatt2, ifelse(classDyn %v% "female" == 3, input$color_actatt3,ifelse(classDyn %v% "female" == 4, input$color_actatt4, ifelse(classDyn %v% "female" == 5, input$color_actatt5,ifelse(classDyn %v% "female" == 6, input$color_actatt6,ifelse(classDyn %v% "female" == 7, input$color_actatt7,ifelse(classDyn %v% "female" == 8, input$color_actatt8,ifelse(classDyn %v% "female" == 9, input$color_actatt9, input$color_actatt10))))))))))

		 classDyn %v% "Color" <- ifelse(is.na(classDyn %v% "female"), "NA", ifelse(classDyn %v% "female" == 1, levels(am$genderx)[1], ifelse(classDyn %v% "female" == 2, levels(am$genderx)[2], ifelse(classDyn %v% "female" == 3, levels(am$genderx)[3],ifelse(classDyn %v% "female" == 4, levels(am$genderx)[4], ifelse(classDyn %v% "female" == 5, levels(am$genderx)[5],ifelse(classDyn %v% "female" == 6, levels(am$genderx)[6],ifelse(classDyn %v% "female" == 7, levels(am$genderx)[7],ifelse(classDyn %v% "female" == 8, levels(am$genderx)[8],ifelse(classDyn %v% "female" == 9, levels(am$genderx)[9], levels(am$genderx)[10]))))))))))

		 classDyn %v% "sides" <- ifelse(is.na(classDyn %v% "border"), input$shape_nodes, ifelse(classDyn %v% "border" == 1, input$shape_actatt1, ifelse(classDyn %v% "border" == 2, input$shape_actatt2, ifelse(classDyn %v% "border" == 3, input$shape_actatt3, ifelse(classDyn %v% "border" == 4, input$shape_actatt4, ifelse(classDyn %v% "border" == 5, input$shape_actatt5,ifelse(classDyn %v% "border" == 6, input$shape_actatt6, ifelse(classDyn %v% "border" == 7, input$shape_actatt7, ifelse(classDyn %v% "border" == 8, input$shape_actatt8, ifelse(classDyn %v% "border" == 9, input$shape_actatt9, input$shape_actatt10))))))))))

		 classDyn %v% "Shape" <- ifelse(is.na(classDyn %v% "border"), "NA", ifelse(classDyn %v% "border" == 1, levels(am$border)[1], ifelse(classDyn %v% "border" == 2, levels(am$border)[2], ifelse(classDyn %v% "border" == 3, levels(am$border)[3],ifelse(classDyn %v% "border" == 4, levels(am$border)[4], ifelse(classDyn %v% "border" == 5, levels(am$border)[5],ifelse(classDyn %v% "border" == 6, levels(am$border)[6],ifelse(classDyn %v% "border" == 7, levels(am$border)[7],ifelse(classDyn %v% "border" == 8, levels(am$border)[8],ifelse(classDyn %v% "border" == 9, levels(am$border)[9], levels(am$border)[10]))))))))))

         ###PHUDCFILYclassDyn %v% "bet" <- round(betweenness(classDyn, gmode="graph", cmode="undirected"),2) # Geographic betweenness
         classDyn	%v% "bet"
lev1<-levels(am$border)[1] #PHUDCFILY
lev2<-as.character(levels(am$border)[2]) #PHUDCFILY
classDyn %v% "labels" <- as.character(a$ID[match(classDyn %v% "vertex.names", a$filename)])
classDyn %v% "labels" <- ifelse(is.na(classDyn %v% "labels"), as.character(a$codename)[match(classDyn %v% "vertex.names", a$cid)], classDyn %v% "labels")

#PHUDCFILY

classNets <- get.networks(classDyn,start=0,end=max(a$fid)+1,time.increment=1,rule='latest')
classDensity <- sapply(classNets, network.density)
classDensity<-ifelse(is.na(classDensity), 0, classDensity)
denphu<-max(classDensity)


         # m <- render.d3movie(classDyn,
				# vertex.sides=classDyn %v% "sides",
				# usearrows = F, label.cex=.5,
				# label.col=rgb(21, 21, 21,max=255, 255/2),
				# displaylabels = T, label=classDyn %v% "labels",
				# bg=rgb(255, 255, 255,max=255, 255/2), #222, 222, 222
				# vertex.border="NA",
				# vertex.cex = function(slice){(betweenness(slice,
							# cmode="undirected")/max(classDyn %v% "bet"))+.5},
				# vertex.col = alpha(classDyn %v% "com", input$trans),
				# vertex.tooltip = paste("<b>Role:</b>",(classDyn %v% "role"),"<br>","<b>Influence index:</b>", (classDyn %v% "power"),"<br>","<b>No. of contributions:</b>", (classDyn %v% "f"),"<br>","<b>Attributes:</b>", input$woman,":",(classDyn %v% "Color"), "&", input$shape,":", (classDyn %v% "Shape")),
				# edge.lwd = (classDyn %e% "weight")/4,
				# edge.col = effectFun('edgeAgeColor',fade.dur=input$obs,
                      # start.color=alpha('green',input$trans),end.color=alpha('blue',input$trans), na.color=alpha("black",input$trans)),#rgb(118, 238, 0,max=255, 255/3), #11, 11, 11
				# edge.tooltip = function(slice) {
				# paste("<b>Edge weight:</b>", (slice %e% "weight"), "<br><b>Pct Edge weight:</b>", (slice %e% "pct_weight"),"%", "<br><b>Quote:</b>", (slice %e% "phu"))},
				# launchBrowser=T, filename="asynchronous_analyses.html",
				# render.par=list(tween.frames = 50, show.time = T),#PHUDCFILYmore tweening = slower & smoother NAQD).
				# main=paste("Evolution of coded information weighted by bet centrality\nColors by values in column '",input$woman,"'", ", shapes by values in column '",input$shape,"'"),
			# xlab=function(slice,onset){paste('Network density at time',onset,' based on max density: ',round((network.density(slice)/denphu),3))})
#utils::browseURL(paste(getwd(),"/asynchronous_analyses.html",sep="")) #PHUDCFILY PHUDCFILY

collapsed <- network.collapse(classDyn, onset=1, terminus=max(a$fid)+1)
        render.d3movie(collapsed,
 				vertex.sides=collapsed %v% "sides",
 				usearrows = F, label.cex=.5,
 				label.col=rgb(21, 21, 21,max=255, 255/2),
 				displaylabels = T, label=collapsed %v% "labels",
 				bg=rgb(255, 255, 255, max=255, 255/2), #222, 222, 222
 				vertex.border="NA",
 				vertex.cex = (collapsed %v% "bet"/max(collapsed %v% "bet")+.5),
 				vertex.col = alpha(collapsed %v% "com", input$trans),
 				vertex.tooltip = paste("<b>Role:</b>",(collapsed %v% "role"),"<br>","<b>Influence index:</b>", (collapsed %v% "power"),"<br>","<b>No. of contributions:</b>", (collapsed %v% "f"),"<br>","<b>Attributes:</b>", input$woman,":",(collapsed %v% "Color"), "&", input$shape,":", (collapsed %v% "Shape")),
 				edge.lwd = (collapsed %e% "weight")/4,
 				edge.col = alpha('darkgray',input$trans),#rgb(118, 238, 0,max=255, 255/3), #11, 11, 11
 				edge.tooltip = paste("<b>Edge weight:</b>", (collapsed %e% "weight"), "<br><b>Pct Edge weight:</b>", (collapsed %e% "pct_weight"),"%"),
 				launchBrowser=T, filename="collapsed_analyses.html",
 				main="Aggregated depiction, size by bet centrality")

###PHUDCFILY PHUDCFILY tags$p(a("Click to see full color palette",target="_blank",href="RColorChart.pdf" ))

if (am$rolex!="no_role_selected") {
z <- c()
pdf("www/qap.pdf", 8.5, 9)
library(igraph)
g <- graph.data.frame(am[,c("ID", "codename")])
# plot(g)
V(g)$type <- V(g)$name %in% am$ID
g
table(V(g)$type)

# Number of Human Actors
i<-table(V(g)$type)[2]
full_names <- sort(V(g)$name[(i+1):length(V(g)$name)])
"%ni%" <- Negate("%in%")

for (p in levels(as.factor(am$rolex) )) {

g <- graph.data.frame(am[am$rolex==p,c("ID", "codename")])
V(g)$type <- V(g)$name %in% am$ID
i<-table(V(g)$type)[2]
these_names <- V(g)$name[(i+1):length(V(g)$name)]
di<-full_names %ni% these_names
E(g)$weight <- 1
g.c <- simplify(g)
E(g.c)$weight
g.c<-(add_vertices(g.c, length(full_names[di==TRUE]), name = full_names[di==TRUE], type=FALSE))
Z<-t(as.matrix(get.incidence(g.c, types=NULL, names=TRUE, sparse=FALSE, attr="weight")))
dim(Z)
Zf <- Z[, order(colnames(Z))]
colnames(Zf)
z[[p]] <- as.matrix((t(Zf)>0)%*%(Zf))
write.csv(z[[p]], paste("matrix_", p, ".csv", sep=""), row.names=FALSE)
}
detach(package:igraph)
library(sna)
g <-simplify2array(z)
g <- aperm(g, c(3,1,2)) #aperm, from the base package. It is a generalization of the transpose t() function to multidimensional arrays https://stackoverflow.com/questions/10679131/how-to-change-order-of-array-dimensions
xn <- levels(as.factor(am$rolex) )
x <- 1:length(levels(as.factor(am$rolex) ))
y<-2
all_combinations <- combn(x,y)
all_combinations_n <- (combn(xn,y))
for (p in 1:ncol(all_combinations)) {
set.seed(47)
tmp<-qaptest(g,gcor,g1=all_combinations[1,p],g2=all_combinations[2,p],reps=50000)
summary(tmp)
plot(tmp)
mtext(paste("Comparisons: ",all_combinations_n[1,p], " and ", all_combinations_n[2,p], sep=""), line = 3)

mtext(paste("Observed Rho (blue) = ", round(tmp$testval, 3), ", mean, 50,000 permutations = ", round(mean(tmp$dist), 3), ", (two SDs = ", 2*round(sd(tmp$dist), 3), ", red)", sep=""))

abline(v = -2*round(sd(tmp$dist), 3), col="red", lwd=3, lty=2)
abline(v = 2*round(sd(tmp$dist), 3), col="red", lwd=3, lty=2)
abline(v = round(tmp$testval, 3), col="blue", lwd=3, lty=2)
}
dev.off()
output$tables <- DT::renderDataTable({
datatable(dfphu[,2:ncol(dfphu)], caption=htmltools::tags$p(a("Click here to Open all QAP comparisons",target="_blank",href="qap.pdf")), options = list(
    pageLength = 5))
})
###PHUDCFILY gsub("/", "_", am$rolex) levels(as.factor(gsub("/", "_", am$rolex)))
for (p in levels(as.factor(gsub("/", "_", am$rolex)))) {
library(igraph)
amf<-am

amf<-amf[amf$rolex==p,]
# amf<-am[am$rolex=="Student",]
amf$ID <- droplevels(amf)$ID
amf$codename <- droplevels(amf)$codename
# amf$genderx <- droplevels(amf)$genderx
# amf$rolex <- droplevels(amf)$rolex
# amf$border <- droplevels(amf)$border

af <- amf[,c("ID", "codename")]



 netf <- graph.data.frame(cbind(as.numeric(af$ID), (as.numeric(af$codename)+max(unique(as.numeric(af$ID))))), directed=T)
 V(netf)$type <- V(netf)$name %in% as.numeric(af$ID)
 i<-table(V(netf)$type)[2]

 cent1f<-data.frame(totaldegree=degree(netf, mode="total"),
 indegree=degree(netf, mode="in"), outegree=degree(netf, mode="out"),
 bet=round(betweenness(netf, directed=F, normalized = TRUE, weights=NA),3),
 eig=round(evcent(netf, weights=NA)$vector,3),
 closeness=round((1/closeness(netf))/max(1/closeness(netf)), 3))

 cent1f$eig[1:i]<-round(cent1f$eig[1:i]/max(cent1f$eig[1:i]),2)
 cent1f$eig[(i+1):nrow(cent1f)]<-round(cent1f$eig[(i+1):nrow(cent1f)]/max(cent1f$eig[(i+1):nrow(cent1f)]),2)
 cent1f$bet[1:i]<-round(cent1f$bet[1:i]/max(cent1f$bet[1:i]),2)
 cent1f$bet[(i+1):nrow(cent1f)]<-round(cent1f$bet[(i+1):nrow(cent1f)]/max(cent1f$bet[(i+1):nrow(cent1f)]),2)
 cent1f$id<-rownames(cent1f)
 cent1f$id<-as.numeric(cent1f$id)
netn <- graph.data.frame(af[,c("ID", "codename")], directed=T)
cent1f$nombre <- V(netn)$name
write.csv(cent1f, paste("centrality_db_", p, ".csv", sep=""), row.names=FALSE)

detach(package:igraph)

library(ndtv)
library(networkDynamic) # load the dynamic extensions
library(dplyr)
library(scales)

        af$k<-paste(af$ID, af$codename, sep="")
        a1<-data.frame(table(af$k))

        af$f<-a1$Freq[match(af$k,a1$Var1,)]

        a1<-data.frame(table(af$ID))
        head(a1)
        af$fid<-a1$Freq[match(af$ID,a1$Var1,)]

        af<-af[order(af$ID),]
		amf<-amf[order(amf$ID),]

        af$filename<-as.numeric((af$ID))
        amf$filename<-as.numeric((amf$ID))

        af$on<-(ave(af$filename, af$filename, FUN=seq_along))#-1
        af$term<-(max(af$fid)+1)

		##
        a2f<-af[!duplicated(af$codename),]
        a2f$cid<-as.numeric(a2f$codename)+max(unique(as.numeric(af$ID)))
		##

        af$cid<-a2f$cid[match(af$codename,a2f$codename)]
		amf$cid<-a2f$cid[match(amf$codename,a2f$codename)]

        vd<-data.frame(id=c(unique(af$filename), unique(af$cid)),onset=rep(0,length(c(unique(af$filename), unique(af$cid)))),term=rep((max(af$fid)+1)))

         vd$vertex_id<-as.character(af$codename[match(vd$id,af$cid)])
         vd[is.na(vd$vertex_id),]$vertex_id<-vd[is.na(vd$vertex_id),]$id
         vd
         #PHUDCFILY
         af$lead<-lead(af$on, 1)
         a3f<-af[!duplicated(af$filename),c("fid","filename")]
         head(a3f)
         a3f$last<-a3f$fid+1
         af$lead[cumsum(a3f$fid)]<-a3f$last
         af$lead2<-af$on+2#input$obs#coming from user input PHUDCFILY

         classDyn <- networkDynamic(vertex.spells=vd[,c("onset", "term", "id")], edge.spells=af[,c("on", "lead2", "filename","cid")])

         a2f<-data.frame(c(table(af$filename),table(af$codename)))
         a2f$id<-rownames(a2f)
         names(a2f)[1]<-"f"

         vd
         vd$f<-a2f$f[match(vd$vertex_id,a2f$id)]
         classDyn %v% "f" <- vd$f[match(classDyn %v% "vertex.names", vd$id)]

         bf<-as.data.frame(classDyn)
         head(bf)

		 b1f<-bf[!duplicated(bf$edge.id),]
		 b1f$e.id <- paste(b1f$tail,b1f$head, sep="")
		 # head(b1)

		 af$k2<-paste(af$filename, af$cid,sep="")
		 amf$k2<-paste(amf$filename, amf$cid,sep="")
		 af$edge.id<-b1f$edge.id[match(af$k2, b1f$e.id)]
		 amf$edge.id<-b1f$edge.id[match(amf$k2, b1f$e.id)]
		 af$freq_edge<-round(af$f/af$fid,3)*100

         classDyn <- networkDynamic(vertex.spells=vd[,c("onset", "term", "id")], edge.spells=af[,c("on", "lead2", "filename","cid", "f", "freq_edge")], create.TEAs = TRUE, edge.TEA.names=c("weight", "pct_weight"))

         classDyn %e% "e.id"<- as.numeric(paste(b1f$tail,b1f$head, sep=""))
		 classDyn %v% "f" <- cent1f$totaldegree[match(classDyn %v% "vertex.names", cent1f$id)]

         amf$fid<-as.numeric(as.factor(as.character(amf$ID)))
         amf$bordern<-as.numeric(as.factor(amf$border))
         amf$gendern<-as.numeric(as.factor(amf$genderx))
         amf$rolen<-as.numeric(as.factor(amf$rolex))
		 amf$border <-as.factor(amf$border)
		 amf$genderx <-as.factor(amf$genderx) #gender
		 amf$rolex <-as.factor(amf$rolex)

         classDyn %v% "border" <- amf$bordern[match(classDyn %v% "vertex.names", amf$fid)]
         classDyn %v% "female" <- amf$gendern[match(classDyn %v% "vertex.names", amf$fid)]

		 classDyn %v% "power"	 <- cent1f$eig[match(classDyn %v% "vertex.names", cent1f$id)]#no missing PHUDCFILY
		 classDyn %v% "bet"	 <- cent1f$bet[match(classDyn %v% "vertex.names", cent1f$id)]#no missing PHUDCFILY
         classDyn %v% "role" <- as.character(amf$rolex[match(classDyn %v% "vertex.names", amf$fid)])
		 classDyn %v% "role" <- ifelse(!is.na(classDyn %v% "role"), classDyn %v% "role","code")

         classDyn %v% "com" <- ifelse(is.na(classDyn %v% "female"), input$color_nodes, ifelse(classDyn %v% "female" == 1, input$color_actatt1, ifelse(classDyn %v% "female" == 2, input$color_actatt2, ifelse(classDyn %v% "female" == 3, input$color_actatt3,ifelse(classDyn %v% "female" == 4, input$color_actatt4, ifelse(classDyn %v% "female" == 5, input$color_actatt5,ifelse(classDyn %v% "female" == 6, input$color_actatt6,ifelse(classDyn %v% "female" == 7, input$color_actatt7,ifelse(classDyn %v% "female" == 8, input$color_actatt8,ifelse(classDyn %v% "female" == 9, input$color_actatt9, input$color_actatt10))))))))))

		  # classDyn %v% "com" <- ifelse(is.na(classDyn %v% "female"), "pink", ifelse(classDyn %v% "female" == 1, "green"))

		 classDyn %v% "Color" <- ifelse(is.na(classDyn %v% "female"), "NA", ifelse(classDyn %v% "female" == 1, levels(amf$genderx)[1], ifelse(classDyn %v% "female" == 2, levels(amf$genderx)[2], ifelse(classDyn %v% "female" == 3, levels(amf$genderx)[3],ifelse(classDyn %v% "female" == 4, levels(amf$genderx)[4], ifelse(classDyn %v% "female" == 5, levels(amf$genderx)[5],ifelse(classDyn %v% "female" == 6, levels(amf$genderx)[6],ifelse(classDyn %v% "female" == 7, levels(amf$genderx)[7],ifelse(classDyn %v% "female" == 8, levels(amf$genderx)[8],ifelse(classDyn %v% "female" == 9, levels(amf$genderx)[9], levels(amf$genderx)[10]))))))))))

		 classDyn %v% "sides" <- ifelse(is.na(classDyn %v% "border"), input$shape_nodes, ifelse(classDyn %v% "border" == 1, input$shape_actatt1, ifelse(classDyn %v% "border" == 2, input$shape_actatt2, ifelse(classDyn %v% "border" == 3, input$shape_actatt3, ifelse(classDyn %v% "border" == 4, input$shape_actatt4, ifelse(classDyn %v% "border" == 5, input$shape_actatt5,ifelse(classDyn %v% "border" == 6, input$shape_actatt6, ifelse(classDyn %v% "border" == 7, input$shape_actatt7, ifelse(classDyn %v% "border" == 8, input$shape_actatt8, ifelse(classDyn %v% "border" == 9, input$shape_actatt9, input$shape_actatt10))))))))))

		 # classDyn %v% "sides" <- ifelse(is.na(classDyn %v% "border"), 200, ifelse(classDyn %v% "border" == 1, 3))


		 classDyn %v% "Shape" <- ifelse(is.na(classDyn %v% "border"), "NA", ifelse(classDyn %v% "border" == 1, levels(amf$border)[1], ifelse(classDyn %v% "border" == 2, levels(amf$border)[2], ifelse(classDyn %v% "border" == 3, levels(amf$border)[3],ifelse(classDyn %v% "border" == 4, levels(amf$border)[4], ifelse(classDyn %v% "border" == 5, levels(amf$border)[5],ifelse(classDyn %v% "border" == 6, levels(amf$border)[6],ifelse(classDyn %v% "border" == 7, levels(amf$border)[7],ifelse(classDyn %v% "border" == 8, levels(amf$border)[8],ifelse(classDyn %v% "border" == 9, levels(amf$border)[9], levels(amf$border)[10]))))))))))

         ###PHUDCFILYclassDyn %v% "bet" <- round(betweenness(classDyn, gmode="graph", cmode="undirected"),2) # Geographic betweenness

lev1<-levels(amf$border)[1] #PHUDCFILY
lev2<-as.character(levels(amf$border)[2]) #PHUDCFILY
classDyn %v% "labels" <- as.character(af$ID[match(classDyn %v% "vertex.names", af$filename)])
classDyn %v% "labels" <- ifelse(is.na(classDyn %v% "labels"), as.character(af$codename)[match(classDyn %v% "vertex.names", af$cid)], classDyn %v% "labels")

#PHUDCFILY am

# classNets <- get.networks(classDyn,start=0,end=max(af$fid)+1,time.increment=1,rule='latest')
# classDensity <- sapply(classNets, network.density)
# classDensity<-ifelse(is.na(classDensity), 0, classDensity)
# denphu<-max(classDensity)

collapsed <- network.collapse(classDyn, onset=1, terminus=max(af$fid)+1)
        render.d3movie(collapsed,
 				vertex.sides=collapsed %v% "sides",
 				usearrows = F, label.cex=.5,
 				label.col=rgb(21, 21, 21,max=255, 255/2),
 				displaylabels = T, label=collapsed %v% "labels",
 				bg=rgb(255, 255, 255, max=255, 255/2), #222, 222, 222
 				vertex.border="NA",
 				vertex.cex = (collapsed %v% "bet"/max(collapsed %v% "bet")+.5),
 				vertex.col = alpha(collapsed %v% "com", input$trans),
 				vertex.tooltip = paste("<b>Role:</b>",(collapsed %v% "role"),"<br>","<b>Influence index:</b>", (collapsed %v% "power"),"<br>","<b>No. of contributions:</b>", (collapsed %v% "f"),"<br>","<b>Attributes:</b>", input$woman,":",(collapsed %v% "Color"), "&", input$shape,":", (collapsed %v% "Shape")),
 				edge.lwd = (collapsed %e% "weight")/4,
 				edge.col = alpha('darkgray',input$trans),#rgb(118, 238, 0,max=255, 255/3), #11, 11, 11
 				edge.tooltip = paste("<b>Edge weight:</b>", (collapsed %e% "weight"), "<br><b>Pct Edge weight:</b>", (collapsed %e% "pct_weight"),"%"),
 				launchBrowser=T, filename=paste("collapsed_analyses_", p, ".html", sep=""),
 				main=paste("Aggregated depiction with size by bet centrality, by ", p, sep=""))
# detach(package:ndtv)
# detach(package:networkDynamic) # load the dynamic extensions
# detach(package:dplyr)
# detach(package:scales)
}

###PHUDCFILY

}  else {
output$tables <- DT::renderDataTable({
datatable(dfphu[,2:ncol(dfphu)], caption="When you select a role, all QAP comparisons will be available to download as a link here, instead of this caption", options = list(
    pageLength = 5))
})
}
###PHUDCILY PHUDCFILY

         tags$iframe( #Everything before iframe or it crashes
             srcdoc = paste(readLines('collapsed_analyses.html'), collapse = '\n'),
             width = "50%",
             height = "450px",
			 style="background-color: White;"
         )
} else{

}
     })#closes output$mymap PHUDCFILY


	 # output$tables <- DT::renderDataTable({
# if (input$role!="no_role_added") {
# datatable(a1$dfphu, options = list(
    # pageLength = 5))
# }  else {
# datatable(data.frame(message="Process ends here, no role selected for QAP to be generated"), options = list(
    # pageLength = 1))
# }
# })

# Add this to the server function to terminate R when the app is closed
onStop(function() {
  # Check if we're running in RStudio
  if (Sys.getenv("RSTUDIO") == "1") {
    # If running in RStudio, just print a message
    message("Shiny app closed. To terminate R, please close RStudio.")
  } else {
    # If running outside RStudio, terminate R
    quit(save = "no")
  }
})

 } #closes server PHUDCFILY

shinyApp(ui, server)

#PHUDCFILY
# rsconnect::setAccountInfo(name='NAQD',
			  # token='2AC7246D32DC0E01F051573022DA99A7',
			  # secret='mOv54RmIOxnkn6/szhBe79Qloa9iZmDEgJvliGY/')
