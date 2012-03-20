/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$(function() {
    var where = $( "#where" ),
    when = $( "#when" ),
    attending = $( "#attending" ),
    allFields = $( [] ).add( where ).add( when ).add( attending );


    //INITIAL GROUP/INDIVIDUAL OPTION
    $("#formOption").dialog({
        autoOpen: false,
        height: 100,
        width: 200,
        modal: true
    });
                
    // GROUP / SEVERAL // INDIVIDUAL
    $( "#dialog-form" ).dialog({
        autoOpen: false,
        height: 440,
        width: 350,
        modal: true 
    });

    // EDITING REMOVING
    $("#editRemove").dialog({
        autoOpen: false,
        height: 100,
        width: 200,
        modal: true
    });
    
    // EDITING REMOVING
    $(".editForm").dialog({
        autoOpen: false,
        height: 100,
        width: 200,
        modal: true
    });
    
    // EDITING REMOVING
    $(".removeForm").dialog({
        autoOpen: false,
        height: 100,
        width: 200,
        modal: true
    });
                
    //PERSONAL
    $(".meeting").dialog({
        autoOpen: false,
        height: 350,
        width: 350,
        modal: true 
    })

   
    $( ".selection" ).click(function() {

        $( "#formOption" ).dialog( "open" );
                                   
        // personal 
        var selfClick = false;
        //group/ several
        var groupClick = false;
                                           
        //personal
        $(".self").click(function(){	
            selfClick = true;
            if(selfClick){
                $( ".meeting" ).dialog( "open" ); 
            }
        });

        //group/several // individual
        $(".groupForm").click(function(){
            groupClick = true;
    				
            if(groupClick){
                $("#dialog-form").dialog("open");
            }
        });	
    }); 
        
    $( ".occupied" ).click(function() {
        $( "#editRemove").dialog("open");
        //edit
        var editClick = false;
        //remove
        var removeClick = false;
            
        //editing
        $(".edit").click(function(){	
            editClick = true;
            if(editClick){                    
                $( ".editForm" ).dialog( "open" ); 
            }
        });
                            
        //removing
        $(".remove").click(function(){	
            removeClick = true;
            if(removeClick){
                                      
            $( ".removeForm" ).dialog( "open" ); 
            }
        });
    });
});

