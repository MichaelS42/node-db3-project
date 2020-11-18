// scheme-model
const db = require("../data/dbConfig");

module.exports = {
  find,
  findById,
  findSteps,
  add,
  addStep,
  update,
};

function find() {
  try {
    return db("schemes");
  } catch (error) {
    console.error(error);
  }
}

function findById(id) {
  try {
    return db("schems").where("id", id);
  } catch (error) {
    console.error(error);
  }
}

async function findSteps(id) {
  try {
    return await db("steps").where("id", id);
  } catch (error) {
    console.error(error);
  }
}
async function addStep(stepData, id) {
  try {
    await db("steps")
      .inser({
        scheme_id: id,
        instructions: stepData,
      })
      .then((ids) => {
        return findSteps(ids[0]);
      });
  } catch (error) {
    console.error(error);
  }
}

async function update(changes, id) {
  await db("schemes")
    .update(changes)
    .where("id", id)
    .then((id) => {
      return findById(id);
    });
}
