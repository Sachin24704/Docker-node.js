import { Router } from "express";
const router = Router();
router.get("/", (req, res) => {
  res.json({ message: " hello from docker" });
});

router.get("/health", (req, res) => {
  res.json({ message: "Everything is good at this endpoint" });
});

export default router;
