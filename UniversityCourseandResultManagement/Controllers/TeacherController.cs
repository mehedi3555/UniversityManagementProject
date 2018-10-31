using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityCourseandResultManagement.BLL;
using UniversityCourseandResultManagement.Models;

namespace UniversityCourseandResultManagement.Controllers
{
    public class TeacherController : Controller
    {
        DepartmentManager aDepartmentManager = new DepartmentManager();
        DesignationManager aDesignationManager = new DesignationManager();
        TeacherManager aTeacherManager = new TeacherManager();

        [HttpGet]
        public ActionResult SaveTeacher()
        {
            ViewBag.Departments = aDepartmentManager.GetAllDepartments();
            ViewBag.Designations = aDesignationManager.GetAllDesignations();
            return View();
        }

        [HttpPost]
        public ActionResult SaveTeacher(Teacher aTeacher)
        {
            ViewBag.Departments = aDepartmentManager.GetAllDepartments();
            ViewBag.Designations = aDesignationManager.GetAllDesignations();
            ViewBag.Message = aTeacherManager.Save(aTeacher);
            return View();
        }

        [HttpGet]
        public JsonResult IsEmailExist(Teacher aTeacher)
        {
            List<Teacher> teachers = aTeacherManager.GetAllTeachers();
            bool isExist = teachers.FirstOrDefault(t => t.TracherEmail.ToLowerInvariant().Equals(aTeacher.TracherEmail.ToLower())) != null;
            return Json(!isExist, JsonRequestBehavior.AllowGet);
        }
	}
}