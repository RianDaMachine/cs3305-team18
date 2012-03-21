/*
 * Author : Liz Hayes
 * CoAuthor : Luke Murphy
 */

$(function() {
    var where = $( "#where" ),
    when = $( "#when" ),
    attending = $( "#attending" ),
    allFields = $( [] ).add( where ).add( when ).add( attending );


    $( "#dialog-form" ).dialog({
        autoOpen: false,
        height: 430,
        width: 350,
        modal: true,
        buttons: {
            "Create": function() {
                var bValid = true;
                allFields.removeClass( "ui-state-error" );

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
                //>>>>>>> .r21
                //
                //<<<<<<< .mine
                if ( bValid ) {
                    var meeting = where.val() + " " + when.val() + " " + attending.val();
                    $( "#table tbody" ).append( "<tr>" +
                        "<td class=\"selectrion\">" + meeting + "</td>" 
                        + "</tr>" );
                    document.getElementById(id).style.backgroundColor();
                                                    
                    $( this ).dialog( "close" );
                }
            },
            Cancel: function() {
                $( this ).dialog( "close" );
            }
        },
        close: function() {
            allFields.val( "" ).removeClass( "ui-state-error" );
        }
    });

    $("#formOption").dialog({
        autoOpen: false,
        height: 100,
        width: 200,
        modal: true
    });
    // EDITING REMOVING
    $("#editRemove").dialog({
        autoOpen: false,
        height: 100,
        width: 200,
        modal: true
    });
    
    // EDITING
    $(".editForm").dialog({
        autoOpen: false,
        height: 200,
        width: 200,
        modal: true
    });
    
    // REMOVING
    $(".removeForm").dialog({
        autoOpen: false,
        height: 200,
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

