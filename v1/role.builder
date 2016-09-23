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
    run: function(creep) {

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
            var targets = creep.pos.findClosestByPath(FIND_CONSTRUCTION_SITES);

            if(creep.build(targets) == ERR_NOT_IN_RANGE) 
            {
                creep.moveTo(targets);
            }
        }
        else 
        {
            
            var sources = creep.pos.findClosestByPath(FIND_STRUCTURES, {
                    filter: (structure) => {
                        return ( ( structure.structureType == STRUCTURE_CONTAINER ) && ( structure.store > 0 ) )
                    }
            });
            
            if(creep.withdraw(sources,RESOURCE_ENERGY) == ERR_NOT_IN_RANGE) 
            {
                creep.moveTo(sources);
            }
        }
	}
};

module.exports = roleBuilder;