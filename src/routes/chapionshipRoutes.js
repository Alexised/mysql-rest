const User=require('../models/user');

module.exports=function(app){
    app.get('/chapionship',(req,res)=>{
        User.getChapionship((err,data)=>{
            res.status(200).json(data)
        })
    });
    
  app.post('/chapionship',(req,res)=>{
    const chapionshipData={
        idChampionship:null,
        Name_Championship:req.body.Name_Championship,
        City_Championship:req.body.City_Championship
       
    };

    User.insertchampionship(chapionshipData,(err,data)=>{
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


    app.put('/chapionship/:id   ' ,(req,res)=>{
        const chapionshipData={
            idChampionship:req.params.id,
            Name_Championship:req.body.Name_Championship,
            City_Championship:req.body.City_Championship
           
        };
        User.updateChapionship(chapionshipData,(err,data)=>{
            if(data&&data.msg){
                res.json(data)
            }else{
                res.json({
                    success:false,
                    msg:'error'
                })
            }
        })
    })
    app.delete('/chapionship/:id' ,(req,res)=>{

    })
}