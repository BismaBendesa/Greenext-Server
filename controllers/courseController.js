const db = require("../config/db");

const getOrSearchCourse = async (req, res) => {
  const { search } = req.query; //  GET /api/v1/course?search=pengenalan get api/v1/course?search=teknik+pertanian+tradisional

  try {
    let query = `SELECT * FROM course`;
    const values = [];
    if (search) {
      query += ` WHERE name LIKE ? OR description LIKE ?`;
      values.push(`%${search}%`, `%${search}%`);
    }

    const [result] = await db.query(query, values);

    // course not found
    if (result.length === 0) {
      return res
        .status(404)
        .json({ success: false, message: "No course found" });
    }

    res.status(200).json({
      success: true,
      data: result,
      message: search ? "Course found!" : "Get Course success",
    });
  } catch (error) {
    console.error("Error search query", error.message);
    res.status(500).json({ success: false, message: "Internal server error" });
  }
};

const addCourse = async (req, res) => {
  const {
    name,
    description,
    difficulty,
    status,
    price,
    total_hours,
    image_cover,
  } = req.body;

  console.log(req.body);
  // validation
  if (!name || !description || price === undefined) {
    return res.status(400).json({
      success: false,
      message: "Missing required fields",
      log: req.body,
    });
  }
  try {
    const createdBy = req.user.id; // use the user id from the token
    const updatedBy = req.user.id;

    const query = `INSERT INTO course (name, description, difficulty, status, price, total_hours, image_cover created_by, created_at, updated_by, updated_at)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, NOW(), ?, NOW())`;
    const result = await db.query(query, [
      name,
      description,
      difficulty || "easy",
      status || "active",
      price,
      total_hours || 0,
      image_cover || "foto2.jpg",
      createdBy,
      updatedBy,
    ]);
    res.status(201).json({
      success: true,
      message: "Course added succesfully!",
      courseId: result.insertId,
      user: req.user, // include user info in the response
    });
  } catch (error) {
    console.error("Error Adding Course", error.message);
    res.status(500).json({ success: false, message: "Internal Server Error" });
  }
};

const updateCourse = async (req, res) => {
  const { id } = req.params;
  const {
    name,
    description,
    difficulty,
    status,
    price,
    total_hours,
    image_cover,
  } = req.body;

  // check the id of targeted course
  if (!id) {
    return res
      .status(400)
      .json({ success: false, message: "Course ID Not Found" });
  }

  const updatedBy = req.user.id;

  // make sure all fields not empty
  if (
    !name &&
    !description &&
    !difficulty &&
    !status &&
    !price &&
    !total_hours &&
    !image_cover
    // !updated_by &&
    // !created_by
  ) {
    return res
      .status(400)
      .json({ success: false, message: "No fields to update provided" });
  }

  try {
    let query = `UPDATE course SET `;
    const fields = [];
    const values = [];
    if (name) {
      fields.push("name = ?");
      values.push(name);
    }
    if (description) {
      fields.push("description = ?");
      values.push(description);
    }
    if (difficulty) {
      fields.push("difficulty = ?");
      values.push(difficulty);
    }
    if (status) {
      fields.push("status = ?");
      values.push(status);
    }
    if (status) {
      fields.push("status = ?");
      values.push(status);
    }
    if (price) {
      fields.push("price = ?");
      values.push(price);
    }
    if (total_hours) {
      fields.push("total_hours = ?");
      values.push(total_hours);
    }
    if (image_cover) {
      fields.push("image_cover = ?");
      values.push(image_cover);
    }

    fields.push("updated_by = ?");
    values.push(updatedBy);
    fields.push("updated_at = NOW()"); // update the updated_at fields in database

    query += fields.join(", ") + `WHERE id = ?`;
    values.push(id); // add the id from req.params.id

    const result = await db.query(query, values);

    // check if there's any course
    if (result.affectedRows === 0) {
      return res
        .status(404)
        .json({ success: false, message: "Course Not Found" });
    }

    res
      .status(200)
      .json({ success: true, message: "Course Updated successfully!" });
  } catch (error) {
    console.error("Error updating course", error);
    res.status(500).json({ success: false, message: "Internal server Error" });
  }
};

const getCourseById = async (req, res) => {
  const { id } = req.params;

  if (!id) {
    return res
      .status(404)
      .json({ success: false, message: "No id passed in params" });
  }

  try {
    const query = "SELECT * FROM course where id = ?";
    const result = await db.query(query, [id]);
    res.status(200).json({ success: true, data: result[0] });
  } catch (error) {
    console.error("Error get course by id failed", error.message);
    res.status(500).json({ success: false, message: "Internal Server Error" });
  }
};

const deleteCourse = async (req, res) => {
  const { id } = req.params;

  try {
    const query = `DELETE FROM course WHERE id = ?`;
    const result = await db.query(query, [id]);

    if (result.affectedRows == 0) {
      return res
        .status(404)
        .json({ success: false, message: "Course not found" });
    }

    res.status(200).json({
      success: true,
      message: `Course succesfully deleted`,
      courseId: result.insertId,
    });
  } catch (error) {
    console.error("Error deleting course", error.message);
    res.status(500).json({ success: false, message: "Internal server error" });
  }
};

const getModule = async (req, res) => {
  const { idCourse } = req.params;

  if (!idCourse) {
    return res
      .status(400)
      .json({ success: false, message: "Missing course id" });
  }
  try {
    const query = `SELECT * FROM module where id_course = ${idCourse}`;
    const [result] = await db.query(query);
    res.status(400).json({
      success: true,
      message: `Get module with id : ${idCourse} successful!`,
      data: result,
    });
  } catch (error) {
    console.error("Error get module content!", error.message);
    res.status(500).json({ success: false, message: "Internal server error!" });
  }
};

const createModule = async (req, res) => {
  const { module_number, module_description } = req.body;
  const { id } = req.params;
  const createdBy = req.user.id;
  const updatedBy = req.user.id;

  // Check if there's any course
  if (!id) {
    return res
      .status(400)
      .json({ success: false, message: "Course ID Not Found" });
  }
  // simple validation
  if (module_number == undefined || !module_description) {
    return res
      .status(400)
      .json({ success: false, message: "Missing required files!" });
  }

  try {
    const query =
      "INSERT INTO module (id_course, module_number, module_description, created_at, created_by, updated_at, updated_by) VALUES (?, ?, ?, NOW(), ?, NOW(), ?)";
    const result = await db.query(query, [
      id,
      module_number,
      module_description,
      createdBy,
      updatedBy,
    ]);
    res.status(201).json({
      success: true,
      message: "Module added successfully!",
      module_id: result.insertId,
    });
  } catch (error) {
    console.error("Error Add Module", error.message);
    res.status(500).json({ success: false, message: "Internal Server Error" });
  }
};

const createModuleContent = async (req, res) => {
  const { text, type, video, file } = req.body;
  const { id } = req.params;
  const createdBy = req.user.id; // taken from the middleware
  const updatedBy = req.user.id;

  if (!text || !type) {
    return res
      .status(400)
      .json({ success: false, message: "Missing Required Fields" });
  }

  try {
    const query =
      "INSERT INTO module_content (id_module, text, type, video, file, created_at, created_by, updated_at, updated_by) VALUES (?, ?, ?, ?, ?, NOW(), ?, NOW(), ?)";
    const [result] = await db.query(query, [
      id,
      text,
      type,
      video || null,
      file || null,
      createdBy,
      updatedBy,
    ]);
    res.status(201).json({
      success: true,
      message: "Module content added successfully",
      moduleContentTextId: result.insertId,
    });
  } catch (error) {
    console.error("Error Adding Course", error.message);
    res.status(500).json({ success: false, message: "Internal Server Error" });
  }
};

const createModuleReference = async (req, res) => {
  const { id } = req.params;
  const { reference, link } = req.body;

  try {
    const query =
      "INSERT INTO module_reference (id_module, reference, link, created_at, updated_at) VALUES (?, ?, ?, NOW(), NOW())";

    const [result] = await db.query(query, [id, reference, link]);

    res.status(200).json({
      success: true,
      message: "Module reference added successfully",
      courseId: result.insertId,
    });
  } catch (error) {
    console.error("Erro Add Module Reference", error.message);
    res.status(500).json({ success: false, message: "Internal server error" });
  }
};

module.exports = {
  getOrSearchCourse,
  addCourse,
  updateCourse,
  getCourseById,
  deleteCourse,
  createModule,
  createModuleContent,
  createModuleReference,
  getModule,
};
