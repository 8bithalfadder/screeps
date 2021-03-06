/*
 * Module code goes here. Use 'module.exports' to export things:
 * module.exports.thing = 'a thing';
 *
 * You can import it from another modules like this:
 * var mod = require('role.builder');
 * mod.thing == 'a thing'; // true
 */

var roleBuilder = {

    /** @param {Creep} creep **/
    run: function(creep) 
    {

        if(creep.memory.building && creep.carry.energy == 0) 
        {
            creep.memory.building = false;
            //creep.say('harvesting');
	    }
	    if(!creep.memory.building && creep.carry.energy == creep.carryCapacity) 
	    {
	        creep.memory.building = true;
	        //creep.say('building');
	    }


        if(creep.memory.building) 
        {
            /*
            var targets = creep.pos.findClosestByPath(FIND_CONSTRUCTION_SITES);

            if(targets != undefined)
            {
                if(creep.build(targets) == ERR_NOT_IN_RANGE) 
                {
                    creep.moveTo(targets);
                }
            }
            else
            {
                targets = creep.pos.findClosestByPath(FIND_STRUCTURES, { filter: (structure) => (structure.structureType == STRUCTURE_WALL || structure.structureType == STRUCTURE_RAMPART) && structure.hits < 150000 });
                if(creep.repair(targets) == ERR_NOT_IN_RANGE) 
                {
                    creep.moveTo(targets);
                }
            }
            */
            var towers = Game.rooms['E39N45'].find(
            FIND_MY_STRUCTURES, {filter: {structureType: STRUCTURE_TOWER}});
            
            if(creep.transfer(towers,RESOURCE_ENERGY) == ERR_NOT_IN_RANGE) 
                {
                    creep.moveTo(towers);
                }
            
        }
        else 
        {
            
            var sources = creep.room.storage;
            if(creep.withdraw(sources,RESOURCE_ENERGY) == ERR_NOT_IN_RANGE) 
            {
                creep.moveTo(sources);
            }
            
            /*else
            {
                var sources = creep.pos.findClosestByPath(FIND_STRUCTURES, {
                    filter: (structure) => structure.structureType == STRUCTURE_CONTAINER && structure.store[RESOURCE_ENERGY] > 0 
            });
                if(creep.withdraw(sources,RESOURCE_ENERGY) == ERR_NOT_IN_RANGE) 
                {
                    creep.moveTo(sources);
                }
                
            }*/
        }
	}
};

module.exports = roleBuilder;