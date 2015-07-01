#----------------------------------------------------------
# set my local CRAN mirror here.
local({r = getOption("repos")
      r["CRAN"] = "http://cran.revolutionanalytics.com"
      options(repos=r)})
 
options(stringsAsFactors=FALSE)
options(max.print=100)
#to never use scientific notation to express very small or large numbers.
options(scipen=10)
#options(editor="vim")
#options(show.signif.stars=FALSE)
options(menu.graphics=FALSE)
options(prompt="> ")
options(continue="... ")
options(width = 80)
# exit without save 
q = function (save="no", ...) {
  quit(save=save, ...)
}
#tab-complete package names for use in “library()” or “require()” calls
utils::rc.settings(ipck=TRUE)
#echo a timestamp to the console and to my R history file at very beginning 
.First = function(){
  if(interactive()){
    library(utils)
    timestamp(,prefix=paste("##------ [",getwd(),"] ",sep=""))
   }
}
# need updates
.Last = function() {
	# save command history here?
	cat("\nGoodbye at ", date(), "\n")
}
#Enables the colorized output from R 
if(Sys.getenv("TERM") == "xterm-256color")
  library("colorout")
 
quiet_library = function(a.package){
 suppressWarnings(suppressPackageStartupMessages(
     library(a.package,quietly=TRUE,character.only=TRUE)))
       }

# construct autoload package lists
auto_loads_pkgs = c("dplyr", "ggplot2")
if(interactive()){
  invisible(sapply(auto_loads_pkgs, quiet_library))
}
#rm(auto_loads_pkgs)

#---------------------------------------------------------------------
#creates a new hidden namespace that we can store some functions
#---------------------------------------------------------------------
.env = new.env()
## Returns names(df) in single column, numbered matrix format.
.env$n = function(df) matrix(names(df))
# undo the factor in df
.env$unfactor = function(df){
  id = sapply(df, is.factor)
  df[id] = lapply(df[id], as.character)
  df
}
## Single character shortcuts for summary() and head().
.env$s = base::summary
.env$h = utils::head
## ht==headtail, i.e., show the first and last 10 items of an object
.env$ht = function(d) rbind(head(d,10),tail(d,10))
## Show the first 5 rows and first 5 columns of a data frame or matrix
.env$hh = function(d) if(class(d)=="matrix"|class(d)=="data.frame") d[1:5,1:5] 
## Read data on clipboard.
.env$read.cb = function(...) {
  ismac = Sys.info()[1]=="Darwin"
  if (!ismac) read.table(file="clipboard", ...)
  else read.table(pipe("pbpaste"), ...)
}
## List objects and classes (from @_inundata, mod by ateucher)
.env$lsa = function() {
{
    obj_type = function(x) class(get(x, envir = .GlobalEnv)) # define environment
    foo = data.frame(sapply(ls(envir = .GlobalEnv), obj_type))
    foo$object_name = rownames(foo)
    names(foo)[1] = "class"
    names(foo)[2] = "object"
    return(unrowname(foo))
}
## List all functions in a package (also from @_inundata)
.env$lsp = function(package, all.names = FALSE, pattern) {
    package = deparse(substitute(package))
    ls(
        pos = paste("package", package, sep = ":"),
        all.names = all.names,
        pattern = pattern
    )
}
attach(.env)
#--------------------------------------------------------------------- 
#end of new def of env
#--------------------------------------------------------------------- 
 
message("n*** Successfully loaded .Rprofile ***n")
