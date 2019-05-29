const User=require('../models/user');

module.exports=function(app){
    app.get('/Groups',(req,res)=>{
        User.getGroups((err,data)=>{
            res.status(200).json(data)
        })
    });
    
app.post('/Groups',(req,res)=>{
    const GroupData={
        idGroups:null,
        Name_Groups:req.body.Name_Groups,
        Championship_idChampionship:req.body.Championship_idChampionship

    };
    User.insertGroups(GroupData,(err,data)=>{
        if(data && data.insertId ){
            res.json({
                success:true,
                msg:'dato insertado',
                data:data
            })
        }else{
            res.status(500).json({
                success:false,
                msg:'Error'
            })
        }
    })
});
}
