 REMARK % RLSPRT.PAT
 REMARK % PATCH TO SCAN SIGNAL STATE FOR CHANGE WHEN -RLSPT SET
        ORG     DET100+12
        HC      0,0,0
        ORG     DET100+12
        J       P1END,,
        ORG     P1END
        TBT     R8,RLSPT,,
        JN      DET105
        TBT     R8,SIN
        J       DET100+18

P1END   EQ      .
 REMARK % END RLSPRT.PAT BWING 05AUG85 HQTECH
  