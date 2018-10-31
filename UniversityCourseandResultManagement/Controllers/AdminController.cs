using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Eramake;
using UniversityCourseandResultManagement.BLL;
using UniversityCourseandResultManagement.Models;

namespace UniversityCourseandResultManagement.Controllers
{
    public class AdminController : Controller
    {

        AdminManager adminManager = new AdminManager();
        DashboardManager aDashboardManager = new DashboardManager();

        [HttpGet]
        public JsonResult IsUserNameExist(Admin aAdmin)
        {
            List<Admin> admins = adminManager.GetAdmin();
            bool isExist = admins.FirstOrDefault(a => a.UserName.ToLowerInvariant().Equals(aAdmin.UserName.ToLower())) != null;
            return Json(!isExist, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult AdminRegister()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(Admin admin)
        {
            admin.Password = eCryptography.Encrypt(admin.Password);
            ViewBag.Message = adminManager.Save(admin);
            return View();
        }

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Auth(Admin aAdmin)
        {
            var data = adminManager.GetAdmin();
            var adminDetails = data.Where(a => a.UserName == aAdmin.UserName && eCryptography.Decrypt(a.Password) == aAdmin.Password).FirstOrDefault();
            if (adminDetails == null)
            {
                ViewBag.EMessage = "Wrong User Name or Password";
                return View("../Admin/Login");
            }
            else
            {
                Session["Id"] = adminDetails.Id;
                Session["Name"] = adminDetails.Name;
                
                ViewBag.Teachers = aDashboardManager.GetTotalTeacher();
                ViewBag.Students = aDashboardManager.GetTotalStudent();
                ViewBag.Departments = aDashboardManager.GetTotalDepartment();
                ViewBag.Rooms = aDashboardManager.GetTotalRoom();
                ViewBag.Chart = aDashboardManager.GetCount();
                return View("../Dashboard/Dashboard");
            }
        }

        [HttpGet]
        public ActionResult Logout()
        {
            Session.Abandon();
            return RedirectToAction("Login", "Admin");
        }
	}
}