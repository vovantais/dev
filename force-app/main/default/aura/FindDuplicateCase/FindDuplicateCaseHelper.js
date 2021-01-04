({
	mergeRecords  : function(component, event, helper, response,openModel) {
		const wrap= document.querySelector('.wrapper').children;
		
		[...wrap].forEach((item,index) => {
		item.addEventListener('click', (e)=> {
			if(e.target.classList.contains('btn-marge')){
            let checkQueue = response[index].OwnerId.slice(0,3);
            	if((response[index].Status === 'In progres' || response[index].Status === 'OnHold') && response[index].OwnerId !==checkQueue){
            		component.set("v.isOpen", !openModel);
      			}
				}
			});
		});
		
	},
})