
program suffermerge(input,output);
 
   type
 
     pointer = ^pointertype;
     pointertype = record
                     data: char;
                     next: pointer;
                   end;
 
 
   var
     ans : char;
     notdone : boolean;
     list1,
     list2,
     list3 : pointer;
 
 
procedure suffert(list1,list2:pointer; var list3:pointer);
 
  var
     special,
     curr1,
     temp1,
     curr2,
     temp2,
     curr3,
     temp3: pointer;
 
  begin
     curr1 := list1;
     curr2 := list2;
 
     while ( ( curr1 <> nil) and (curr2 <> nil) ) do
        begin
 
           new(temp3);
           temp3^.data := curr1^.data;
           curr1 := curr1^.next;
 
           if (list3 = nil) then
              list3 := temp3
           else
              curr3^.next := temp3;
 
           curr3 := temp3;
           new(temp3);
           temp3^.data := curr2^.data;
           curr2 := curr2^.next;
           curr3^.next := temp3;
           curr3 := temp3;
        end;
 
      if (curr1 <> nil) then
         special := curr1
      else if (curr2 <> nil) then
               special := curr2;
 
      while (special <> nil) do
         begin
            new(temp3);
            temp3^.data := special^.data;
            special := special^.next;
            curr3^.next := temp3;
            curr3 := temp3;
         end;
 
      temp3^.next := nil;
 
   end;
 
(*********************************************************************)
 
procedure attach( data: char; var list,last: pointer);
 
   var
      temp : pointer;
 
   begin
      new(temp);
      temp^.data := data;
      temp^.next := nil;
 
      if (last = nil) then
          list := temp
      else
          last^.next := temp;
 
      last := temp;
 
   end;
 
(************************************************************************)
 
procedure readlist(var list: pointer);
   var
      data: char;
      last: pointer;
 
   begin
 
      last := nil;
      write('enter a data item ($ to stop) : ');
      readln(data);
 
      while( data <> '0') do
         begin
            attach(data,list,last);
            write('enter a data item ($ to stop) : ');
            readln(data);
         end;
    end;
 
(***********************************************************************)
 
 
procedure printlist(list: pointer);
 
    var
       curr: pointer;
 
    begin
       curr := list;
       while( curr <> nil) do
          begin
             write(curr^.data,' ');
             curr := curr^.next;
          end;
 
    end;
 
(**************************************************************************)
 
begin
 
    notdone := true;
    while ( notdone = true) do
       begin
          writeln('Please enter the first list ');
          list1 := nil;
          readlist(list1);
          writeln;
          writeln('Please enter the second list');
          list2 := nil;
          readlist(list2);
          writeln;
          list3 := nil;
          suffert(list1,list2,list3);
 
          write('The first list is   ---> ');
          printlist(list1);
          writeln;
          writeln;
          write('The second list is  ---> ');
          printlist(list2);
          writeln;
          writeln;
          write('The suffert emerged ---> ');
          printlist(list3);
          writeln;
          writeln;
 
          write('continue (y/n)? ' );
          readln(ans);
          if (ans = 'n') or (ans = 'N') then
             notdone := false;
 
       end;
 
end.
 

 